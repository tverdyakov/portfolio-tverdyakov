# 4.5 Сеть и сетевые протоколы: Firewall

### Общие критерии оценки
Задание считается выполненным при соблюдении следующих условий:
- Выполнено оба задания.
- К заданиям прикреплены скриншоты настроек виртуальных машин и их доступности после выполнения каждого задания.
- Отображены настройки конфигурации Firewal.

## Задание 1. Создание виртуального окружения и настройка сетевых интерфейсов

### Описание задания
Перед вами стоит задача создать две виртуальные машины с операционной системой Debian и настроить управление трафиком.

### Требование к результату
Вы должны создать и настроить две виртуальные машины с операционной системой Debian. К выполненной задаче добавьте скриншоты настроек IP-адресов интерфейсов, таблиц маршрутизации, конфигурации файервола и результатов выполнения всех упомянутых проверок ping.

### Процесс выполнения
1. Запустите программу VirtualBox.
2. В программе VirtualBox создайте две виртуальные машины с Debian, назовите их vm1 и vm2
3. В VirtualBox создайте виртуальную сеть 192.168.123.0/24
4. В VirtualBox настройте сетевые интерфейсы vm1 так, чтобы один интерфейс имел доступ в интернет (bridge или NAT), а второй интерфейс смотрел в виртуальную сеть 192.168.123.0/24
5. В VirtualBox настройте сетевой интерфейс vm2 так, чтобы он смотрел только в виртуальную сеть 192.168.123.0
6. Для vm1: настройте статический IP адрес у интерфейса смотрящего в сеть 192.168.123.0 (адрес в сети 123.0 выберите на своё усмотрение). Настройте IP-адрес интерфейса смотрящего в вашу локальную сеть так, проверьте чтобы была доступность по ICMP c vm1 до 8.8.8.8.
7. Для vm2: настройте статический IP адрес у интерфейса смотрящего в сеть 192.168.123.0 (адрес в сети 123.0 выберите на своё усмотрение), шлюзом укажите IP vm1 из сети 192.168.123.0
8. Проверьте доступность по ICMP:
 - vm2 с vm1 по IP
 - vm1 с vm2 по IP 
9. Приложите скриншоты результата.
10. Настройте пересылку трафика на vm1, чтобы с vm2 можно было отправить ICMP-запросы на 8.8.8.8 и приложите скриншот результата.
11. Ответ внесите в комментарии к решению задания в личном кабинете Нетологии.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.1.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.2.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.3.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.4.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.5.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.6.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.7.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/01.8.png)

--- 

## Задание 2. Настройка проброса портов

### Описание задания
Перед вами стоит задача настроить проброс портов из локальной сети компьютера в виртуальную сеть.

### Требование к результату
К выполненной задаче добавьте скриншот настроек и успешное подключение через ssh.

### Процесс выполнения
1. Запустите программу VirtualBox.
2. В программе VirtualBox используйте результат предыдущей практической работы.
3. Настройте проброс портов из локальной сети компьютера с VirtualBox через vm1 порт 12322 в виртуальную сеть VirtualBox на 22 порт vm2.
4. Подключитесь к vm2 по ssh через Putty как было показано на уроке. Ответ внесите в комментарии к решению задания в личном кабинете Нетологии

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/02.1.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/02.2.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/05.%20Firewall/screenshots/02.3.png)

---
