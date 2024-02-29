# 4.4 L4-сеть

## Инструкция по выполнению: 
- Выполните оба задания.
- Сделайте скриншоты из Cisco Packet Tracer по итогам выполнения каждого задания.
- Отправьте на проверку в личном кабинете Нетологии PKT-файл. Прикрепите его в раздел «Решение» в практическом задании.
- В комментариях к решению в личном кабинете напишите пояснения к полученным результатам. 

---

### Задание 1. Настройка маршрутизатора
*Важно. Задание сквозное и составлено на основе практического задания из домашней работы [4.3 «L3-сеть».](https://github.com/netology-code/snet-homeworks/blob/snet-18/4-03.md)*

### Описание задания
Вам нужно создать и настроить подключение по telnet к маршрутизатору в главном офисе. 

### Требования к результату:
- Отправьте PKT-файл с выполненным заданием.
- Добавьте скриншоты с состояниями TCP-соединений и ответы на вопросы.

### Процесс выполнения:
1. Запустите программу Cisco Packet Tracer.
2. В программе загрузите предыдущую практическую работу.
3. Настройте на маршрутизаторе главного офиса возможность подключения по telnet. Желательно указывать пароль в зашифрованном виде с помощью service password-encryption.
4. В Cisco Packet Tracer запустите режим симуляции и начните из командной строки с любого ПК главного офиса процесс подключения по telnet к маршрутизатору.
5. В режиме симуляции найдите момент, когда процесс трёхстороннего рукопожатия между ПК и маршрутизатором окончен и TCP-соединение установлено.
6. В командной строке выбранного ПК выполните вход на маршрутизатор с помощью ранее указанного пароля.
7. Посмотрите на маршрутизаторе все TCP-соединения. Сделайте скриншот.
8. Продолжая работать в режиме симуляции, завершите в командной строке сеанс telnet на ПК. Укажите момент, когда процесс TCP-соединения между ПК и маршрутизатором окончен.
9. Ответы внесите в комментарии к решению задания в личном кабинете.

### Ответ:
**Все пароли - cisco**

[L4 - Задание 1.pkt](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/L4%20-%20Задание%201.pkt)

- Пароль в зашифрованном виде
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.1.png)

- Подключение по telnet
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.2.png)

- Подключение по telnet
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.3.png)

- Режим симуляции и подключение по telnet
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.4.png)

- The TCP connection is successful
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.5.png)

- Все TCP-соединения
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.6.png)

- Момент, когда процесс TCP-соединения между ПК и маршрутизатором окончен
- Cеанс завершил с помощью сочетаний клавиш Ctrl + ]. Далее в командной строке ввел quit. После состояние сокета перешло в статус close.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/01.7.png)





---

### Задание 2. Анализ трафика
*Важно. Задание сквозное и составлено на основе практической задачи из домашней работы [4.3 «L3-сеть».](https://github.com/netology-code/snet-homeworks/blob/snet-18/4-03.md)*

### Описание задания
Вам нужно инициализировать в сети процесс отправки UDP-сообщений.

### Требование к результату
К выполненному заданию добавьте скриншот со структурой пакета и ответ на вопрос.

### Процесс выполнения:
1. Запустите программу Cisco Packet Tracer.
2. В программе загрузите предыдущую практическую работу.
3. Инициализируйте в командной строке любого ПК процесс отправки UDP-пакета.
4. Какие порты использует выбранный вами протокол или технология? Ответ внесите в комментарии к решению задания в личном кабинете.

### Ответ:
Src Port: 1025

Dst Port: 53

Процесс отправки UDP-пакета
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/04.%20L4-сеть/screenshots-and-files/02.png)

---
