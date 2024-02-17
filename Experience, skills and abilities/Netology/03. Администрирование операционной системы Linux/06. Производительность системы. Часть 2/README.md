# 3.6 Производительность системы. Часть 2.

### Задание 1.

Составьте задание через утилиту `cron` на проверку обьема кэша-обновлений еженедельно.

Кэш-обновлений - это обновления которые остаются после выполнения `apt update`, `apt upgrade`.

*Приведите ответ в виде команды.*

#### *Ответ:*
```Bash
0 1 * * 3 du -s -h /var/cache/apt/archives/ >> ~/3.6task1
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/01.png)

---

### Задание 2.

- Запустите процесс копирования большого файла на жесткий диск.
- Запустите команду `iostat`.
- Запустите `iotop`.

Какие процессы влияют на данные команды?

*Проведите развернутый ответ и приложите снимки экрана.*

#### *Ответ:*
- Запустите процесс копирования большого файла на жесткий диск.

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/02.1.png)
- Запустите команду `iostat`.

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/02.2.png)
- Запустите `iotop`.

![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/02.3.png)

Какие процессы влияют на данные команды?

*Процессы чтения и записи.*

---

### Задание 3.

Настройте приоритет использования `swap` в пропорции:

- 30/70;
- 50/50;
- 70/30.

Запустите браузер и нагрузите память.

Проанализируйте результат.

*Проведите развернутый ответ и приложите снимки экрана.*

#### *Ответ:*

*Чем выше приоритет swap, тем больше ядро перемещает информации в раздел подкачки.*

- 30/70;
```Bash
sudo sysctl vm.swappiness=30
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/03.1.png)
- 50/50;
```Bash
sudo sysctl vm.swappiness=50
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/03.2.png)
- 70/30.
```Bash
sudo sysctl vm.swappiness=70
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/06.%20Производительность%20системы.%20Часть%202/03.3.png)

---


