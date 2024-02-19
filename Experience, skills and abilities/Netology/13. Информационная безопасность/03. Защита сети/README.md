# 13.3 Защита сети

### Подготовка к выполнению заданий

1. Подготовка защищаемой системы:

- установите **Suricata**,
- установите **Fail2Ban**.

2. Подготовка системы злоумышленника: установите **nmap** и **thc-hydra** либо скачайте и установите **Kali linux**.

Обе системы должны находится в одной подсети.

#### Защищаемая система - Debian - enp0s8 - 192.168.123.111
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%200.1.png)


#### Система злоумышленника - Kali Linux - eth1 - 192.168.123.10
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%200.2.png)

---

### Задание 1

Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:

**sudo nmap -sA < ip-адрес >**

**sudo nmap -sT < ip-адрес >**

**sudo nmap -sS < ip-адрес >**

**sudo nmap -sV < ip-адрес >**

### *Решение:*

**sudo nmap -sA 192.168.123.111** 

Suricata не реагирует на это сканирование.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.2.png)

**sudo nmap -sT 192.168.123.111**

Suricata определяет подозрительный входящий трафик на порты: 3306 MySQL, 1433 MSSQL, 5432 PostgreSQL, 1521 Oracle SQL, и классифицирует его как "Потенциально опасный трафик" со средним приоритетом. И потенциальное сканирование VNC 5900-5920 с классификацией "Попытка утечки информации" со средним приоритетом.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.4.png)

**sudo nmap -sS 192.168.123.111**

Suricata определяет то же, что и при сканировании nmap -sT. Различия только в портах атакующего хоста и порте атакуемого хоста при потенциальном сканировании VNC 5900-5920.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.6.png)

**sudo nmap -sV 192.168.123.111**

Suricata, помимо похожей информации при сканировании nmap -sT и nmap -sS, обнаруживает пользовательский агент скриптового движка Nmap (Nmap Scripting Engine) с классификацией "Атака веб-приложений" и высоким приоритетом.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.7.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.8.png)

#### Fail2Ban 

Fail2Ban никак не отреагировал. Но, при последнем сканировании, в логах операционной системы появилась информация об ошибке и закрытии соединения атакующим хостом.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.9.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%201.10.png)

По желанию можете поэкспериментировать с опциями: https://nmap.org/man/ru/man-briefoptions.html.

*В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.*

------

### Задание 2

Проведите атаку на подбор пароля для службы SSH:

**hydra -L users.txt -P pass.txt < ip-адрес > ssh**

1. Настройка **hydra**: 
 
 - создайте два файла: **users.txt** и **pass.txt**;
 - в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя.

Дополнительная информация по **hydra**: https://kali.tools/?p=1847.

2. Включение защиты SSH для Fail2Ban:

-  открыть файл /etc/fail2ban/jail.conf,
-  найти секцию **ssh**,
-  установить **enabled**  в **true**.

Дополнительная информация по **Fail2Ban**:https://putty.org.ru/articles/fail2ban-ssh.html.

*В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.*

### Решение
#### Проводим атаку на подбор пароля для службы SSH:
**hydra -L users.txt -P pass.txt 192.168.123.111 ssh**

Пароль не был подобран, так как атакующая машина попала в бан. 
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%202.1.png)

#### События Suricata 
Сканирование идет с разных портов атакующего хоста на 22 порт атакуемого хоста.
Suricata определяет:
"Потенциальное SSH-сканирование", "Потенциальное SSH-сканирование ИСХОДЯЩЕЕ" и классифицирует его как "Попытку утечки информации" со средним приоритетом; 
"Обнаружен протокол только в одном направлении", "Поток с избыточными повторными передачами", классифицирует его как "Декодирование команд общего протокола" с низким приоритетом.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%202.2.png)

#### События Fail2Ban
Fail2Ban реагирует на атаку и множественный подбор пользователя и пароля, и помещает атакующий хост в бан. 
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%202.3.png)

#### События операционной системы
Идут множественные попытки подбора пользователя и пароля с разных портов, но останавливаются после попадания в бан атакующего хоста 192.168.123.10.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%202.5.png)

#### Повторная атака на подбор пароля. 
Получаем ошибку, что нет возможности соединиться с атакуемым хостом, так как в соединении отказано.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/03.%20Защита%20сети/screenshots/Задание%202.4.png)

---

