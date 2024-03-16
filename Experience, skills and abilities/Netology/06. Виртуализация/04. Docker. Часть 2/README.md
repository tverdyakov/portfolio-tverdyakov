# 6.4 Docker. Часть 2

### Задание 1

**Напишите ответ в свободной форме, не больше одного абзаца текста.**

Установите Docker Compose и опишите, для чего он нужен и как может улучшить вашу жизнь.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/01.png)

Docker Compose нужен для создания, удаления, сбора, запуска, управления, настройки и маршрутизирования потоков данных групп контейнеров, описанных в одном конфигурационном файле под названием docker-compose.yml. Docker Compose упрощает развертывание, настройку, перенос на другой сервер, тем самым сокращая время на все перечисленное.

---

### Задание 2 

**Выполните действия и приложите текст конфига на этом этапе.** 

Создайте файл docker-compose.yml и внесите туда первичные настройки: 

 * version;
 * services;
 * networks.

При выполнении задания используйте подсеть 172.22.0.0.
Ваша подсеть должна называться: <ваши фамилия и инициалы>-my-netology-hw.

### Ответ:
```
version: "3"
services:
  
networks:
  tverdyakovmu-my-netology-hw:
    driver: bridge
    ipam:
      config:
      - subnet: 172.22.0.0/24
```

---

### Задание 3 

**Выполните действия и приложите текст конфига текущего сервиса:** 

1. Установите PostgreSQL с именем контейнера <ваши фамилия и инициалы>-netology-db. 
2. Предсоздайте БД <ваши фамилия и инициалы>-db.
3. Задайте пароль пользователя postgres, как <ваши фамилия и инициалы>12!3!!
4. Пример названия контейнера: ivanovii-netology-db.
5. Назначьте для данного контейнера статический IP из подсети 172.22.0.0/24.

### Ответ:
```
netology-db:
    image: postgres:latest
    container_name: tverdyakovmu-netology-db
    ports:
      - 5432:5432
    volumes:
      - ./pg_data:/var/lib/postgresql/data/pgdata
    environment:
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
      POSTGRES_DB: tverdyakovmu-db
      PGDATA: /var/lib/postgresql/data/pgdata
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.2
    restart: always
```

---

### Задание 4 

**Выполните действия:**

1. Установите pgAdmin с именем контейнера <ваши фамилия и инициалы>-pgadmin. 
2. Задайте логин администратора pgAdmin <ваши фамилия и инициалы>@ilove-netology.com и пароль на выбор.
3. Назначьте для данного контейнера статический IP из подсети 172.22.0.0/24.
4. Прокиньте на 80 порт контейнера порт 61231.

В качестве решения приложите:

* текст конфига текущего сервиса;
* скриншот админки pgAdmin.

### Ответ:
```
  pgadmin:
    image: dpage/pgadmin4
    container_name: tverdyakovmu-pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: tverdyakovmu@ilove-netology.com
      PGADMIN_DEFAULT_PASSWORD: 123112233
    ports:
      - "61231:80"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.3
    restart: always
```

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/04.png)

---

### Задание 5 

**Выполните действия и приложите текст конфига текущего сервиса:** 

1. Установите Zabbix Server с именем контейнера <ваши фамилия и инициалы>-zabbix-netology. 
2. Настройте его подключение к вашему СУБД.
3. Назначьте для данного контейнера статический IP из подсети 172.22.0.0/24.

### Ответ:
```
  zabbix-server:
    image: zabbix/zabbix-server-pgsql
    links:
      - netology-db
    container_name: tverdyakovmu-zabbix-netology
    environment:
      DB_SERVER_HOST: '172.22.0.2'
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
    ports:
      - "10051:10051"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.4
    restart: always
```

---

### Задание 6

**Выполните действия и приложите текст конфига текущего сервиса:** 

1. Установите Zabbix Frontend с именем контейнера <ваши фамилия и инициалы>-netology-zabbix-frontend. 
2. Настройте его подключение к вашему СУБД.
3. Назначьте для данного контейнера статический IP из подсети 172.22.0.0/24.

### Ответ:
```
  zabbix_wgui:
    image: zabbix/zabbix-web-apache-pgsql
    links:
      - netology-db
      - zabbix-server
    container_name: tverdyakovmu-netology-zabbix-frontend
    environment:
      DB_SERVER_HOST: '172.22.0.2'
      POSTGRES_USER: 'postgres'
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
      ZBX_SERVER_HOST: "zabbix_wgui"
      PHP_TZ: "Europe/Moscow"
    ports:
      - "80:8080"
      - "443:8443"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.5
    restart: always
```

---

### Задание 7 

**Выполните действия.**

Настройте линки, чтобы контейнеры запускались только в момент, когда запущены контейнеры, от которых они зависят.

В качестве решения приложите:

* текст конфига **целиком**;
* скриншот команды docker ps;
* скриншот авторизации в админке Zabbix.

### Ответ:
```
version: "3"
services:
  netology-db:
    image: postgres:latest
    container_name: tverdyakovmu-netology-db
    ports:
      - 5432:5432
    volumes:
      - ./pg_data:/var/lib/postgresql/data/pgdata
    environment:
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
      POSTGRES_DB: tverdyakovmu-db
      PGDATA: /var/lib/postgresql/data/pgdata
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.2
    restart: always

  pgadmin:
    image: dpage/pgadmin4
    links:
      - netology-db
    container_name: tverdyakovmu-pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: tverdyakovmu@ilove-netology.com
      PGADMIN_DEFAULT_PASSWORD: 123112233
    ports:
      - "61231:80"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.3
    restart: always

  zabbix-server:
    image: zabbix/zabbix-server-pgsql
    links:
      - netology-db
    container_name: tverdyakovmu-zabbix-netology
    environment:
      DB_SERVER_HOST: '172.22.0.2'
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
    ports:
      - "10051:10051"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.4
    restart: always

  zabbix_wgui:
    image: zabbix/zabbix-web-apache-pgsql
    links:
      - netology-db
      - zabbix-server
    container_name: tverdyakovmu-netology-zabbix-frontend
    environment:
      DB_SERVER_HOST: '172.22.0.2'
      POSTGRES_USER: 'postgres'
      POSTGRES_PASSWORD: tverdyakovmu12!3!!
      ZBX_SERVER_HOST: "zabbix_wgui"
      PHP_TZ: "Europe/Moscow"
    ports:
      - "80:8080"
      - "443:8443"
    networks:
      tverdyakovmu-my-netology-hw:
        ipv4_address: 172.22.0.5
    restart: always

networks:
  tverdyakovmu-my-netology-hw:
    driver: bridge
    ipam:
      config:
      - subnet: 172.22.0.0/24
```

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/07.1.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/07.2.png)

---

### Задание 8 

**Выполните действия:** 

1. Убейте все контейнеры и потом удалите их.
1. Приложите скриншот консоли с проделанными действиями.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/08.png)

---

### Задание 9* 

Запустите свой сценарий на чистом железе без предзагруженных образов.

**Ответьте на вопросы в свободной форме:**

1. Сколько ушло времени на то, чтобы развернуть на чистом железе написанный вами сценарий?
2. Чем вы занимались в процессе создания сценария так, как это видите вы?

### Ответ:

Ушло 47 секунд.

Делал описание и настройку сервисов, их параметров, и сети.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/04.%20Docker.%20Часть%202/screenshots/09.png)

---
