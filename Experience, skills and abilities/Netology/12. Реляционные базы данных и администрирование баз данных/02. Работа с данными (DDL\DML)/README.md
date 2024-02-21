# 12.2 Работа с данными (DDL/DML)
Задание можно выполнить как в любом IDE, так и в командной строке.

### Задание 1
1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.

1.2. Создайте учётную запись sys_temp. 

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)

1.4. Дайте все права для пользователя sys_temp. 

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

1.6. Переподключитесь к базе данных от имени sys_temp.

Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.

1.7. Восстановите дамп в базу данных.

1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*

#### *Ответ:*

1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.
```bash
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.28-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.28-1_all.deb
sudo apt update
sudo apt install mysql-server
sudo systemctl status mysql
sudo systemctl enable mysql
mysql -u root -p
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.1.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.1.2.png)

1.2. Создайте учётную запись sys_temp. 
```bash
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY '1234567';
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.2.png)

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)
```bash
SELECT user FROM mysql.user;
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.3.png)

1.4. Дайте все права для пользователя sys_temp. 
```bash
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost' WITH GRANT OPTION;
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.4.png)

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)
```bash
SELECT * FROM information_schema.user_privileges WHERE GRANTEE="'sys_temp'@'localhost'";
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.5.png)

1.6. Переподключитесь к базе данных от имени sys_temp.
```bash
SYSTEM mysql -u sys_temp -p
SELECT user();
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.6.png)

Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
1.7. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.
```bash
wget https://downloads.mysql.com/docs/sakila-db.zip
unzip sakila-db.zip
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.7.1.png)

1.8. Восстановите дамп в базу данных.
```bash
source /home/tverdyakov/sakila-db/sakila-schema.sql
source /home/tverdyakov/sakila-db/sakila-data.sql
SHOW DATABASES;
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.7.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.7.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.7.4.png)

1.9. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)
```bash
SHOW TABLES;
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.8.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%201.8.2.png)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*


### Задание 2
Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)
```
Название таблицы | Название первичного ключа
customer         | customer_id
```

#### *Ответ:*
```bash
+---------------+--------------+
| TABLE_NAME    | COLUMN_NAME  |
+---------------+--------------+
| actor         | actor_id     |
| address       | address_id   |
| category      | category_id  |
| city          | city_id      |
| country       | country_id   |
| customer      | customer_id  |
| film          | film_id      |
| film_actor    | actor_id     |
| film_actor    | film_id      |
| film_category | film_id      |
| film_category | category_id  |
| film_text     | film_id      |
| inventory     | inventory_id |
| language      | language_id  |
| payment       | payment_id   |
| rental        | rental_id    |
| staff         | staff_id     |
| store         | store_id     |
+---------------+--------------+
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%202.png)

---

### Задание 3*

3.1. Уберите у пользователя sys_temp права на внесение, изменение и удаление данных из базы sakila.

3.2. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

#### *Ответ:*

```bash
exit
SELECT user();
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'sys_temp'@'localhost';
SHOW GRANTS FOR 'sys_temp'@'localhost';
GRANT ALL PRIVILEGES ON sakila.* TO 'sys_temp'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'sys_temp'@'localhost';
REVOKE INSERT, UPDATE, DELETE ON sakila.* FROM 'sys_temp'@'localhost';
SHOW GRANTS FOR 'sys_temp'@'localhost';
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%203.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/12.%20Реляционные%20базы%20данных%20и%20администрирование%20баз%20данных/02.%20Работа%20с%20данными%20(DDL%5CDML)/screenshots/Задание%203.2.png)

---
