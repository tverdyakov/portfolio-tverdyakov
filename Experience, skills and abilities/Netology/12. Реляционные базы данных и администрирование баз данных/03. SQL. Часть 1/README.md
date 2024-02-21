# 12.3 SQL. Часть 1

Задание можно выполнить как в любом IDE, так и в командной строке.

### Задание 1

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

#### *Ответ:*
```sql
SELECT DISTINCT district
FROM address
WHERE district LIKE 'K%a' AND district NOT LIKE '% %';
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%201.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%201.1.png)

### Задание 2

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года **включительно** и стоимость которых превышает 10.00.

#### *Ответ:*
```sql
SELECT payment_date, amount
FROM payment
WHERE amount > 10 AND payment_date BETWEEN '2005-06-15 00:00:00' AND '2005-06-18 23:59:59';
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%202.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%202.1.png)

### Задание 3

Получите последние пять аренд фильмов.

#### *Ответ:*
```sql
SELECT rental_date
FROM rental
ORDER BY rental_date DESC
LIMIT 5;
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%203.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%203.1.png)

### Задание 4

Одним запросом получите активных покупателей, имена которых Kelly или Willie. 

Сформируйте вывод в результат таким образом:
- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.

#### *Ответ:*
```sql
SELECT CONCAT((REPLACE(LOWER(first_name), 'll', 'pp')), " ", LOWER(last_name)) AS 'Имя и фамилия' , active
FROM customer
WHERE active = 1 AND first_name IN ('Kelly', 'Willie');
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%204.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/03.%20SQL.%20Часть%201/screenshots/Задание%204.1.png)

---
