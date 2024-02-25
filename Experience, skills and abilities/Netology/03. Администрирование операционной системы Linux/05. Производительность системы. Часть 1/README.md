# 3.5 Производительность системы

### Задание 1.

Выполните проверку системы при помощи команды `top`.

**Выведите сортировку процессов по:**

- памяти;
- времени работы;
- номеру;
- уровню потребления ресурсов.

*Приведите ответ в виде снимков экрана.*
### Ответ:
- памяти; `Shift+M`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/01.1.png)
- времени работы; `Shift+T`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/01.2.png)
- номеру; `Shift+N`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/01.3.png)
- уровню потребления ресурсов. `Shift+P`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/01.4.png)

---

### Задание 2.

Выполните проверку системы при помощи команды `atop` и `atopsar`.

**Выведите сортировку процессов по:**

- общей нагрузке (минимум по трем параметрам);
- загруженности HDD or SSD за указанный временной отрезок (10 минут);
- загруженности RAM за указанный временной отрезок (10 минут).

**Сконфигурировать файл настроек atop - делать снимок памяти каждые пол часа**

*Приведите ответ в виде снимков экрана.*
### Ответ:
- общей нагрузке (минимум по трем параметрам);

Нагрузка на CPU: `Shift+C`
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.1.png)

Нагрузка на память и SWAP:`Shift+M`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.2.png)

Нагрузка на диск:`Shift+D`

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.3.png)
- загруженности HDD or SSD за указанный временной отрезок (10 минут);
```Bash
atopsar -r /var/log/atop/atop_20240217 -b 18:10 -e 18:20 -d
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.4.png)
- загруженности RAM за указанный временной отрезок (10 минут).
```Bash
atopsar -r /var/log/atop/atop_20240217 -b 18:10 -e 18:20 -m
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.5.png)
**Сконфигурировать файл настроек atop - делать снимок памяти каждые пол часа**
```Bash
sudo nano /etc/default/atop
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/02.6.png)

---

### Задание 3.

При помощи команды `mpstat` и ключа `P` выведите информацию по:

- определённому процессору;
- всем процессорам.

*Приведите ответ в виде снимков экрана.*
### Ответ:
- определённому процессору;
```Bash
mpstat -P 1
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/03.1.png)
- всем процессорам.
```Bash
mpstat -P ALL
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/03.2.png)

---

### Задание 4.

Выполните проверку системы при помощи команды `pidstat`.

1. Выведите статистику по эффективности на основе имени процесса.
2. Выведите полный путь процесса.

*Приведите ответ в виде снимков экрана.*
### Ответ:
1. Выведите статистику по эффективности на основе имени процесса.
```Bash
pidstat -G gnome-shell
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/04.1.png)
2. Выведите полный путь процесса.
```Bash
pidstat -l -G gnome-shell
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/05.%20Производительность%20системы.%20Часть%201/04.2.png)

---
