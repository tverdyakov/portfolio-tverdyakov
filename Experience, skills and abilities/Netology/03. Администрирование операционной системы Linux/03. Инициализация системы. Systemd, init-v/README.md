# 3.3 Инициализация системы, Init, systemd

### Задание 1.

Выполните systemd-analyze blame.

*Укажите, какие модули загружаются дольше всего.*

#### *Ответ:*
```
2.524s nginx.service
2.343s plymouth-quit-wait.service
1.791s fwupd.service
 947ms systemd-binfmt.service
 736ms systemd-timesyncd.service
 361ms dev-sda1.device
 285ms e2scrub_reap.service
 219ms udisks2.service
 202ms phpsessionclean.service
 164ms apparmor.service
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/03.%20Инициализация%20системы.%20Systemd%2C%20init-v/01.png)

---

### Задание 2.

Какой командой вы посмотрите ошибки ядра, произошедшие начиная со вчерашнего дня?

*Напишите ответ в свободной форме.*

#### *Ответ:*
```Bash
journalctl -p err --since=yesterday --until=now
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/03.%20Инициализация%20системы.%20Systemd%2C%20init-v/02.png)

---

### Задание 3.

Запустите команду loginctl user-status.

*Что выполняет, для чего предназначена эта утилита?*

#### *Ответ:*
*Утилита позволяет узнать подробности о сессии пользователя. Предназначена для вывода информации о начале сессии, статусе, активных сессиях и всех сервисов и процессов пользователя.*
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/03.%20Инициализация%20системы.%20Systemd%2C%20init-v/03.png)

---

### Задание 4.

Есть ли у вас на машине службы, которые не смогли запуститься? Как вы это определили?

*Приведите ответ в свободной форме.*

#### *Ответ:*
*Нет.*

*Команды:*
```Bash
systemctl list-units --type=service --failed
systemctl list-units --failed
systemctl --state=failed
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/03.%20Инициализация%20системы.%20Systemd%2C%20init-v/04.png)

---

### Задание 5.

Можно ли с помощью systemd отмонтировать раздел/устройство?

*Приведите ответ в свободной форме.*

#### *Ответ:*
*Да, можно.*
```Bash
man systemd-mount
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/03.%20Инициализация%20системы.%20Systemd%2C%20init-v/05.png)

---
