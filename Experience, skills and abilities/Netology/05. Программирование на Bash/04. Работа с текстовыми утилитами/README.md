# 5.4 Работа с текстовыми утилитами

### Задание 1.

- Найдите все файлы с расширением `.conf` в /etc сначала с помощью команды `find`, а потом с помощью команды `locate`;
- Перенаправьте результаты работы каждой команды в разные файлы;
- Подсчитайте количество найденных файлов в каждом случае с помощью `wc`;
- Объясните причину расхождений результатов, если таковые имеются.

### Ответ:
- `find`
```bash
sudo find /etc -name "*.conf" > find-conf
cat find-conf | wc -l
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/04.%20Работа%20с%20текстовыми%20утилитами/01.1.png)

- `locate`
```bash
sudo updatedb
locate "/etc/*.conf" > locate-conf
cat locate-conf | wc -l
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/04.%20Работа%20с%20текстовыми%20утилитами/01.2.png)

---

### Задание 2.

 - Выведите с помощью `cat` содержимое всех файлов в директории /etc `cat /etc/*`;
 - Направьте ошибки в отдельный файл в вашей домашней директории;
 - Стандартный поток вывода направьте в другой файл;
 - Подсчитайте, сколько объектов не удалось прочитать.

### Ответ:
```bash
sudo cat /etc/* 2> errors-5-4-2 > main-5-4-2
cat errors-5-4-2 | wc -l
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/04.%20Работа%20с%20текстовыми%20утилитами/02.png)

---

### Задание 3.

 - Перенаправьте результат работы команды `ls -l` в каталоге с большим количеством файлов в утилиту `cut`, чтобы отобразить только права доступа к файлам;
 - Отправьте в конвейере этот вывод на `sort` и `uniq`, чтобы отфильтровать все повторяющиеся строки;
 - Уберите из подсчета строку `total`;
 - С помощью `wc` подсчитайте различные типы разрешений в этом каталоге.
 
### Ответ:
```bash
ls -l /proc | cut -d ' ' -f 1 | sort | uniq -c | grep -v итого | wc -l
ls -l /proc | cut -d ' ' -f 1 | sort | uniq -c | grep -v итого
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/04.%20Работа%20с%20текстовыми%20утилитами/03.png)

---

### Задание 4.

В ОС Linux скрытыми файлами считаются те, имена которых начинаются с точки.

Сколько скрытых файлов в вашем домашнем каталоге?

### Ответ:
```bash
find ~ -maxdepth 1 -type f -name ".*" | wc -l

```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/04.%20Работа%20с%20текстовыми%20утилитами/04.png)

---
