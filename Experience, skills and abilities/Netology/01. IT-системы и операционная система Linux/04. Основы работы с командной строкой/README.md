# 1.4 Основы работы с командной строкой

### Задание 1.

Подготовим рабочее пространство
1.	Скачайте с сайта [VirtualBox](https://www.virtualbox.org/) и установите на свой компьютер Virtual Box (или другой гипервизор).
2.	Создайте новую виртуальную машину.
3.	Скачайте [32-разрядный (i386) дистрибутив Debian](https://cdimage.debian.org/debian-cd/current/i386/iso-cd/) с официального сайта.
4.	Установите Debian на вашу виртуальную машину.
5.	Запустите виртуальную машину.

*Сделайте скриншот консоли, где в строке ввода будет ваше ФИО.*

### Ответ:
![Задание 1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/01.png)

---

### Задание 2.

Подключитесь к виртуальной машине, откройте консоль и выполните следущее:

Выведите на экран:
* свою фамилию и имя латиницей;
* дату выполнения и номер лекции, разделенные дефисами;
* информацию о дистрибутиве.

*Сделайте скриншот так, чтобы был виден вывод всех команд, вставьте в документ с ДЗ.*

### Ответ:
```bash
echo "Tverdyakov Mikhail"
date +"%Y-%m-%d - Lecture №4"
cat /etc/os-release
```
![Задание 2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/02.png)

---

### Задание 3.

Создайте каталог, имя которого будет состоять из вашей фамилии и номера лекции, в домашнем каталоге вашего пользователя.

Выведите на экран содержимое домашнего каталога, включая права на файлы, скрытые и системные файлы.

*Сделайте скриншот, вставьте в документ с ДЗ.*

### Ответ:
```bash
mkdir tverdyakov-lecture-4
ls -la
```
![Задание 3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/03.png)

---

### Задание 4.

Переименуйте созданный вами каталог, добавив к нему текущую дату в формате `ГГ-ММ-ДД`;

Создайте в нем файл с именем `concept.1`, который будет содержать следующую информацию:
* а) информация о дистрибутиве,
* б) ваше имя и фамилия,
* в) номер лекции;

Выведите на экран строку с вашей фамилией. Выполните все в одну строку.

*Пришлите получившуюся команду.*

### Ответ:
```bash
mv tverdyakov-lecture-4 tverdyakov-lecture-4_24-02-12; cd tverdyakov-lecture-4_24-02-12; touch concept.1; cat /etc/os-release > concept.1; echo "Tverdyakov Mikhail" >> concept.1; echo "4" >> concept.1; head -n 10 concept.1 | tail -n 1
```
![Задание 4](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/04.png)

---

### Задание 5.

Обновите список пакетов, обновите систему.

Установите на свою виртуальную машину `Midnight Commander` и `Vim` одной командой.

Выберите из списка установленных программ те, что установленны вами.

*Сделайте скриншот, вставьте в документ с ДЗ*

### Ответ:
```bash
sudo apt update
sudo apt upgrade
```
![Задание 5.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/05.1.png)
```bash
sudo apt install -y mc vim
```
![Задание 5.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/05.2.png)
```bash
sudo dpkg --get-selections mc vim
```
![Задание 5.3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/05.3.png)

---

### Задание 6*.

Установите на виртуальную машину **Arch Linux**. Установите программу `neofetch`. Выполните на ней задание 2 (воспользуйтесь `neofetch` для вывода информации о системе).

*Сделайте скриншот информации о системе, выведенной с помощью `neofetch`.*

### Ответ:
```bash
echo "Tverdyakov Mikhail"
date +"%Y-%m-%d - Lecture №4"
neofetch
```
![Задание 6](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/01.%20IT-системы%20и%20операционная%20система%20Linux/04.%20Основы%20работы%20с%20командной%20строкой/06.png)

---
