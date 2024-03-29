# 3.1 Типы дистрибутивов Linux

---

### Задание 1.

Что такое дистрибутив? Какие компоненты могут входить в поставку дистрибутива?

*Напишите ответ в свободной форме.*

### Ответ:
*Дистрибутив – это форма распространения системного программного обеспечения.*

*В поставку дистрибутива входят: ядро, система инициализации, пакетный менеджер, предустановленный и доступный набор ПО, графическая оболочка.*

---

### Задание 2.

Какую роль в появлении Linux сыграл Танненбаум?

*Напишите ответ в свободной форме.*

### Ответ:
*Эндрю Таненбаум сыграл главную роль в появлении Linux. Он написал книгу «Операционные системы. Разработка и реализация» и создал MINIX, операционную систему, которую Линус Торвальдс, создатель Linux, установил на свой 368-ой компьютер. Книга перевернула его представление об операционных системах, а несовершенства терминала MINIX, сподвигли его к написанию собственной программы. Функций терминала стало так много, что Линуса осенило — он создавал не просто терминал, а целую операционную систему.*

---

### Задание 3.

#### А теперь перейдем к практике

Вам желательно иметь 2 виртуальные машины (RPM и Debian), чтобы наглядно видеть как отличается в них работа:

**3.1**

`yum install mc`

`apt install mc`

*Как получить информацию из какого репозитория был установлен пакет?*

**3.2**

*Какой командой можно получить список доступных репозиториев в RPM и Deb- based системах? Два ответа для каждой из систем.*

**3.3**

*Как узнать версию ОС в Linux? Как узнать версию ядра? Укажите для вашей системы, неважно какой.*

**3.4**

*Как узнать какая система инициализации используется в Linux? Укажите для вашей системы, неважно какой.*

### Ответ:

**3.1**

`yum install mc`

`apt install mc`

*Как получить информацию из какого репозитория был установлен пакет?*
```Bash
apt policy mc
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.1.png)
```Bash
dnf info mc
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.2.png)

**3.2**

*Какой командой можно получить список доступных репозиториев в RPM и Deb- based системах? Два ответа для каждой из систем.*
```Bash
apt-cache policy
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.3.png)
```Bash
yum repolist
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.4.png)

**3.3**

*Как узнать версию ОС в Linux? Как узнать версию ядра? Укажите для вашей системы, неважно какой.*
```Bash
hostnamectl
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.5.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.6.png)

**3.4**

*Как узнать какая система инициализации используется в Linux? Укажите для вашей системы, неважно какой.*
```Bash
ls -l  /sbin/init
sudo ls -l /proc/1/exe
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.7.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.8.png)

---

**3.5**

Работайте на любом RPM или Deb- based Linux:

1) отключите автоматическую загрузку графической оболочки;
2) установите графическую оболочку, которой у вас нет в системе. Например, Mate, Xfce, Openbox;
3) включите автоматическую загрузку графической оболочки;
4) загрузитесь в новую графическую оболочку.

*Приложите скриншоты вашего старого и нового рабочих столов.*

Верните настройки к предыдущим значениям.

### Ответ:

***Было:***
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.9.png)
***Стало:***
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.10.png)
***Вернул обратно:***
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/01.%20Типы%20дистрибутивов/03.11.png)

---
