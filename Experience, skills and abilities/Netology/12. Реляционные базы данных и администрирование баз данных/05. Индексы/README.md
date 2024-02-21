# 12.5 Индексы

### Задание 1

Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

#### *Решение:*
```sql
SELECT ROUND((SUM(index_length) / (SUM(data_length) + SUM(index_length))) * 100, 2) AS '% of the total size of all indexes to the total size of all tables', SUM(index_length) AS 'Total size of all indexes', SUM(data_length)+SUM(index_length) AS 'Total size of all tables'
FROM information_schema.tables
WHERE information_schema.tables.table_schema = 'sakila';
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%201.png)

---

### Задание 2

Выполните explain analyze следующего запроса:
```sql
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```
- перечислите узкие места;
- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

#### *Решение:*

### Explain analyze
```sql
EXPLAIN ANALYZE
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id

-> Limit: 1000 row(s)  (cost=0..0 rows=0) (actual time=4381..4381 rows=391 loops=1)
    -> Table scan on <temporary>  (cost=2.5..2.5 rows=0) (actual time=4381..4381 rows=391 loops=1)
        -> Temporary table with deduplication  (cost=0..0 rows=0) (actual time=4381..4381 rows=391 loops=1)
            -> Window aggregate with buffering: sum(payment.amount) OVER (PARTITION BY c.customer_id,f.title )   (actual time=1876..4203 rows=642000 loops=1)
                -> Sort: c.customer_id, f.title  (actual time=1876..1918 rows=642000 loops=1)
                    -> Stream results  (cost=10.6e+6 rows=16.7e+6) (actual time=0.317..1348 rows=642000 loops=1)
                        -> Nested loop inner join  (cost=10.6e+6 rows=16.7e+6) (actual time=0.31..1152 rows=642000 loops=1)
                            -> Nested loop inner join  (cost=8.97e+6 rows=16.7e+6) (actual time=0.307..1022 rows=642000 loops=1)
                                -> Nested loop inner join  (cost=7.3e+6 rows=16.7e+6) (actual time=0.299..843 rows=642000 loops=1)
                                    -> Inner hash join (no condition)  (cost=1.61e+6 rows=16.1e+6) (actual time=0.282..40.7 rows=634000 loops=1)
                                        -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=1.68 rows=16086) (actual time=0.0321..5.48 rows=634 loops=1)
                                            -> Table scan on p  (cost=1.68 rows=16086) (actual time=0.0236..3.76 rows=16044 loops=1)
                                        -> Hash
                                            -> Covering index scan on f using idx_title  (cost=112 rows=1000) (actual time=0.0306..0.192 rows=1000 loops=1)
                                    -> Covering index lookup on r using rental_date (rental_date=p.payment_date)  (cost=0.25 rows=1.04) (actual time=821e-6..0.00117 rows=1.01 loops=634000)
                                -> Single-row index lookup on c using PRIMARY (customer_id=r.customer_id)  (cost=250e-6 rows=1) (actual time=169e-6..183e-6 rows=1 loops=642000)
                            -> Single-row covering index lookup on i using PRIMARY (inventory_id=r.inventory_id)  (cost=250e-6 rows=1) (actual time=100e-6..116e-6 rows=1 loops=642000)
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.2.png)

---
### Узкие места
Как видно из анализа, узкие места обозначены здесь: 
```
-> Temporary table with deduplication  (cost=0..0 rows=0) (actual time=4381..4381 rows=391 loops=1)
-> Window aggregate with buffering: sum(payment.amount) OVER (PARTITION BY c.customer_id,f.title )   (actual time=1876..4203 rows=642000 loops=1)
-> Sort: c.customer_id, f.title  (actual time=1876..1918 rows=642000 loops=1)
```
Использование оконной функции увеличивает количество строк, плюс сортировка по двум параметрам. Удаление повторяющихся строк из-за оконной функции. Плюс лишняя таблица film.

---
### Оптимизация запроса
Удаляю из запроса таблицу film, оператор distinct и оконную функцию. Добавляю GROUP BY.
```sql
EXPLAIN ANALYZE
select concat(c.last_name, ' ', c.first_name), sum(p.amount)
from payment p, rental r, customer c, inventory i
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
GROUP BY concat(c.last_name, ' ', c.first_name);
 
-> Limit: 1000000 row(s)  (actual time=8.84..8.9 rows=391 loops=1)
    -> Table scan on <temporary>  (actual time=8.84..8.88 rows=391 loops=1)
        -> Aggregate using temporary table  (actual time=8.84..8.84 rows=391 loops=1)
            -> Nested loop inner join  (cost=19015 rows=16700) (actual time=0.057..8.03 rows=642 loops=1)
                -> Nested loop inner join  (cost=13170 rows=16700) (actual time=0.0548..7.16 rows=642 loops=1)
                    -> Nested loop inner join  (cost=7325 rows=16700) (actual time=0.0504..6.5 rows=642 loops=1)
                        -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=1633 rows=16086) (actual time=0.0391..4.89 rows=634 loops=1)
                            -> Table scan on p  (cost=1633 rows=16086) (actual time=0.031..3.76 rows=16044 loops=1)
                        -> Covering index lookup on r using rental_date (rental_date=p.payment_date)  (cost=0.25 rows=1.04) (actual time=0.00184..0.0024 rows=1.01 loops=634)
                    -> Single-row index lookup on c using PRIMARY (customer_id=r.customer_id)  (cost=0.25 rows=1) (actual time=880e-6..898e-6 rows=1 loops=642)
                -> Single-row covering index lookup on i using PRIMARY (inventory_id=r.inventory_id)  (cost=0.25 rows=1) (actual time=0.0012..0.00122 rows=1 loops=642)
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.4.png)

---
### Дополнительная оптимизация запроса
Нашел еще одну лишнюю таблицу(inventory) и оптимизировал запрос путём соединения нескольких таблиц.
```sql
EXPLAIN ANALYZE       
SELECT CONCAT(c.last_name, ' ', c.first_name), SUM(p.amount)
FROM payment p
JOIN rental r ON p.payment_date = r.rental_date
JOIN customer c ON r.customer_id = c.customer_id
WHERE date(p.payment_date) = '2005-07-30'
GROUP BY CONCAT(c.last_name, ' ', c.first_name);
 
-> Limit: 1000000 row(s)  (actual time=5.03..5.06 rows=391 loops=1)
    -> Table scan on <temporary>  (actual time=5.03..5.05 rows=391 loops=1)
        -> Aggregate using temporary table  (actual time=5.02..5.02 rows=391 loops=1)
            -> Nested loop inner join  (cost=13170 rows=16700) (actual time=0.0447..4.64 rows=642 loops=1)
                -> Nested loop inner join  (cost=7325 rows=16700) (actual time=0.0411..4.23 rows=642 loops=1)
                    -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=1633 rows=16086) (actual time=0.0314..3.41 rows=634 loops=1)
                        -> Table scan on p  (cost=1633 rows=16086) (actual time=0.0249..2.57 rows=16044 loops=1)
                    -> Covering index lookup on r using rental_date (rental_date=p.payment_date)  (cost=0.25 rows=1.04) (actual time=890e-6..0.00121 rows=1.01 loops=634)
                -> Single-row index lookup on c using PRIMARY (customer_id=r.customer_id)  (cost=0.25 rows=1) (actual time=551e-6..566e-6 rows=1 loops=642)
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.6.png)

### Финальная оптимизация запроса
Добавил индекс на payment_date и переписал условие WHERE. 
```sql
CREATE INDEX payment_index ON payment(payment_date);
 
EXPLAIN ANALYZE   
SELECT CONCAT(c.last_name, ' ', c.first_name), SUM(p.amount)
FROM payment p
JOIN rental r ON p.payment_date = r.rental_date
JOIN customer c ON r.customer_id = c.customer_id
WHERE payment_date >= '2005-07-30' and payment_date < DATE_ADD('2005-07-30', INTERVAL 1 DAY)
GROUP BY CONCAT(c.last_name, ' ', c.first_name);
 
-> Limit: 200 row(s)  (actual time=2.44..2.46 rows=200 loops=1)
    -> Table scan on <temporary>  (actual time=2.44..2.45 rows=200 loops=1)
        -> Aggregate using temporary table  (actual time=2.44..2.44 rows=391 loops=1)
            -> Nested loop inner join  (cost=576 rows=645) (actual time=0.0247..1.99 rows=642 loops=1)
                -> Nested loop inner join  (cost=351 rows=634) (actual time=0.0177..0.77 rows=634 loops=1)
                    -> Filter: ((r.rental_date >= TIMESTAMP'2005-07-30 00:00:00') and (r.rental_date < <cache>(('2005-07-30' + interval 1 day))))  (cost=129 rows=634) (actual time=0.013..0.25 rows=634 loops=1)
                        -> Covering index range scan on r using rental_date over ('2005-07-30 00:00:00' <= rental_date < '2005-07-31 00:00:00')  (cost=129 rows=634) (actual time=0.0114..0.169 rows=634 loops=1)
                    -> Single-row index lookup on c using PRIMARY (customer_id=r.customer_id)  (cost=0.25 rows=1) (actual time=724e-6..736e-6 rows=1 loops=634)
                -> Index lookup on p using payment_index (payment_date=r.rental_date)  (cost=0.254 rows=1.02) (actual time=0.00151..0.00182 rows=1.01 loops=634)
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/05.%20Индексы/screenshots/Задание%202.9.png)

---
