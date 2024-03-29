
# 4.2 L2-сеть

### Инструкция по выполнению: 
- Выполните оба задания.
- Сделайте скриншоты из Cisco Packet Tracer по итогам выполнения каждого задания.
- Отправьте на проверку в личном кабинете Нетологии два PKT-файла. Файлы прикрепите в раздел «Решение» в практическом задании.
- В комментариях к решению в личном кабинете напишите пояснения к полученным результатам.

--- 

### Задание 1. Сборка локальной сети

Описание задания
Вам нужно собрать небольшую локальную сеть, состоящую из шести компьютеров. На устройствах работают сотрудники из трёх разных отделов, необходимо изолировать их друг от друга. 

### Требования к результату:
- Отправьте PKT-файл с выполненным заданием.
- Добавьте скриншоты с доступностью устройств между собой и ответ на вопрос.

### Процесс выполнения:
1. Запустите программу Cisco Packet Tracer.
2. В программе составьте сеть из двух коммутаторов и трёх компьютеров за каждым из них.
3. Создайте три одинаковых VLAN (например: 10, 20, 30) на каждом коммутаторе так, чтобы в каждой из них находился компьютер.
4. Вбейте вручную IP-адреса на сетевых картах компьютеров. Используйте адресацию:
- для VLAN10: 192.168.10.1–192.168.10.10;
- для VLAN20: 192.168.20.1–192.168.20.10;
- для VLAN30: 192.168.30.1–192.168.30.10.

[![](https://i.postimg.cc/cLXTjqHY/65KBba4Q.jpg)](https://postimg.cc/dhZ8kxGt)

5. Создайте доступность в каждом сегменте между компьютерами за разными коммутаторами.
6. Проверьте связь между хостами командой ping.
7. Напишите в комментариях, сколько широковещательных доменов у вас получилось. Ответ внесите в комментарии к решению задания в личном кабинете.

### Топология после выполнения задания должна выглядеть так:
[![](https://i.postimg.cc/cJfzb9pN/UvWd2e7L.jpg)](https://postimg.cc/d7tn7BQW)

### Ответ:
3 широковещательных домена. По одному на каждый VLAN.

[L2 - Задание 1.pkt](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/L2%20-%20Задание%201.pkt)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.4.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/1.6.png)

--- 

### Задание 2. Подключение дополнительных устройств к локальной сети

Описание задания
Вам нужно подключить три дополнительных ноутбука к одному из отделов. Отдельное условие — до дополнительных рабочих мест нужно организовать резервный канал. Это позволит эффективнее решать задачи и не зависеть от сетевых проблем.

### Требования к результату:
- Отправьте PKT-файл с выполненным заданием.
- Добавьте скриншоты с доступностью устройств между собой и ответы на вопросы.

### Процесс выполнения:
1. Запустите программу Cisco Packet Tracer.
2. К результату задания 1 добавьте три ноутбука, которые подключены к хабу, а хаб — к отдельному дополнительному коммутатору.
3. Все три ноутбука должны находится во одной VLAN (например, 10).
4. Вбейте вручную IP-адреса на сетевых картах ноутбуков. Адресацию используйте аналогичную:
- для VLAN10: 192.168.10.1–192.168.10.10;
- для VLAN20: 192.168.20.1–192.168.20.10;
- для VLAN30: 192.168.30.1–192.168.30.10.
5. Соедините этот коммутатор с двумя остальными так, чтобы был отдельный канал до каждого коммутатора. Напишите в комментариях, почему один из каналов между коммутаторами получился неактивным.
6. Сделайте так, чтобы резервный канал при отказе основного обеспечивал доступность ноутбуков с компьютерами в одной VLAN.
7. Проверьте связь между ноутбуками и компьютерами в одной VLAN командой ping.
8. В чём преимущества и недостатки этой сети? Ответ внесите в комментарии к решению задания в личном кабинете.

### Топология после выполнения задания должна выглядеть так:
[![](https://i.postimg.cc/1tb1xnvk/ZbT9gBgY.jpg)](https://postimg.cc/sQPN7Xdm)

### Ответ:

[L2 - Задание 2.pkt](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/L2%20-%20Задание%202.pkt)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/2.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/2.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/2.3.png)

Сработал STP протокол, основной задачей которого является устранение петель в сети. 

На первом скрине BLK на Switch0 Gi0/2, Role - Altn.
На втором скрине убрал кабель между Switch1 и Switch2, проверил доступность ноутбуков и компьютеров в одной VLAN. Switch0 Gi0/2 перешел в статус FWD, Role - Desg. Резервный канал обеспечивает доступность ноутбуков с компьютерами в одной VLAN.

Преимущества: 
Резервный канал.
Каждый VLAN представляет отдельный широковещательный домен. 
Увеличение безопасности сети.
Уменьшение количества используемого оборудования.
Скорость реализации.
Простота в управлении сети.

Недостатки:
При поломке одного Switch, работа между VLAN будет нарушена.
При переходе на резервный канал есть задержка.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/Screenshot%201.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/02.%20L2-сеть/screenshots-and-files/Screenshot%202.png)

--- 
 
### Общие критерии оценки
Домашнее задание считается выполненным, если:
- Выполнены оба задания.
- К заданию прикреплены два PKT-файла и скриншоты доступности устройств по итогам выполнения каждого задания.
- На основе задания правильно функционирует сеть: в первой VLAN — пять устройств, во второй VLAN — два устройства, в третьей VLAN — два устройства.
- В рамках каждой VLAN устройства доступны по IP-адресам между собой.
- Резервный канал обеспечивает работоспособность устройств в рамках одной VLAN.
