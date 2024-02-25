# 13.1 Уязвимости и атаки на информационные системы

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя **nmap**.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:

- Какие сетевые службы в ней разрешены?
- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)
  
*Приведите ответ в свободной форме.*  

### Ответ:
- Какие сетевые службы в ней разрешены?

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%201.png)

- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)
#### 1. vsftpd 2.3.4: [Backdoor Command Execution (Metasploit)](https://www.exploit-db.com/exploits/17491)
#### 2. UnrealIRCd 3.2.8.1: [Backdoor Command Execution (Metasploit)](https://www.exploit-db.com/exploits/16922)
#### 3. PostgreSQL 8.3.6: [Conversion Encoding Remote Denial of Service](https://www.exploit-db.com/exploits/32849)
#### 4. PostgreSQL 8.3.6: [Low Cost Function Information Disclosure](https://www.exploit-db.com/exploits/32847)

---

### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
- Как отвечает сервер?

*Приведите ответ в свободной форме.*
### Ответ:
#### Режим SYN.
Отправляется пакет с флагом SYN для установки соединения. Ответ SYN/ACK - порт открыт (После происходит сброс соединения RST). Ответ RST/ACK - порт закрыт.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.2.png)

#### Режим FIN.
Отправляется пакет с флагом FIN. Ответ RST/ACK - порт закрыт. Если ответа нет - порт открыт|фильтруется.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.4.png)

#### Режим Xmas.
Отправляется пакет с флагами FIN/PSH/URG. Ответ RST/ACK - порт закрыт. Если ответа нет - порт открыт|фильтруется.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.6.png)

#### Режим UDP.
Отправляет пустой UDP заголовок на каждый порт. Ответ ICMP ошибка о недостижимости порта (тип 3, код 3) - порт закрыт. Другие ICMP ошибки недостижимости - порт фильтруется. После нескольких попыток без ответа - порт  открыт|фильтруется. Ответ UDP - порт открыт.
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.7.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/13.%20Информационная%20безопасность/01.%20Уязвимости%20и%20атаки%20на%20информационные%20системы/screenshots/Задание%202.8.png)

---
