# 2.5 Файловые системы

### Задание 1

* Создайте каталог ~/test и в нем файл test_123 с любым содержимым. 
* Создайте символическую ссылку на каталог ~/test по такому пути: /tmp/soft_link.
* Используя ссылку /tmp/soft_link копируйте файл test_123 в каталог /tmp с тем же именем. Создайте жесткую ссылку на файл /tmp/test_123 с именем /tmp/hard_link.

*Вопрос 1: Файл ~/test и /tmp/test_123 это один и тот же файл(одинаковые inode)?*

*Вопрос 2: Файл /tmp/soft_link и /tmp/hard_link это один и тот же файл(одинаковые inode)?*

*Вопрос 3: Файл /tmp/test_123 и /tmp/hard_link это один и тот же файл(одинаковые inode)?*

*Вопрос 4: Докажите что одна из ссылок символическая, а другая жесткая. Обязательно приложите в ответ скриншоты команд, которые иллюстрируют различия ссылок разного типа или(если не уверены) ход решения задания.*

### Ответ:
* Создайте каталог ~/test и в нем файл test_123 с любым содержимым.
* Создайте символическую ссылку на каталог ~/test по такому пути: /tmp/soft_link.
* Используя ссылку /tmp/soft_link копируйте файл test_123 в каталог /tmp с тем же именем. Создайте жесткую ссылку на файл /tmp/test_123 с именем /tmp/hard_link.
```Bash
mkdir ~/test
echo qweasd > ~/test/test_123
ln -s ~/test/test_123 /tmp/soft_link
cat /tmp/soft_link
cp /tmp/soft_link /tmp/test_123
ln /tmp/test_123 /tmp/hard_link
cat /tmp/hard_link
```
![Задание 1.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/01.1.png)
*Вопрос 1: Файл ~/test и /tmp/test_123 это один и тот же файл(одинаковые inode)?*

***inode разные. Это разные файлы.***
```Bash
stat ~/test
stat /tmp/test_123
```
![Задание 1.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/01.2.png)
*Вопрос 2: Файл /tmp/soft_link и /tmp/hard_link это один и тот же файл(одинаковые inode)?*

***inode разные. Это разные файлы.***
```Bash
stat /tmp/soft_link
stat /tmp/hard_link
```
![Задание 1.3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/01.3.png)
*Вопрос 3: Файл /tmp/test_123 и /tmp/hard_link это один и тот же файл(одинаковые inode)?*

***inode одинаковые. Файл один и тот же, так как нет никакой разницы между исходным файлом и жесткой ссылкой, все они относятся к одному и тому же inode, только имеют разные имена.***
```Bash
stat /tmp/test_123
stat /tmp/hard_link
```
![Задание 1.4](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/01.4.png)
*Вопрос 4: Докажите что одна из ссылок символическая, а другая жесткая. Обязательно приложите в ответ скриншоты команд, которые иллюстрируют различия ссылок разного типа или(если не уверены) ход решения задания.*

***Символическая ссылка `/tmp/soft_link` указывает на цель. Плюс на скриншоте к первому вопросу видно, что ссылок на директорию 2, а жесткую ссылку на директорию делать невозможно.***

***Жесткая ссылка `/tmp/hard_link` имеет одинаковые inode c файлом `tmp/test_123`. Нет никакой разницы между исходным файлом и жесткой ссылкой, все они относятся к одному и тому же inode, только имеют разные имена.***
```Bash
ls -li /tmp
```
![Задание 1.5](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/01.5.png)

---
### Задание 2

* Создайте файл `~/netology`
* Создайте каталог `~/netology/`
* Поместите файл `netology` в каталог `netology`

*Какое(ие) из трех действий выполнить невозможно? Почему?*

### Ответ:
*Нельзя создать каталог `~/netology/`, так как файл с таким названием мы создали ранее. В одном каталоге не может быть двух файлов с одинаковыми именами. Все в Linux есть файл.*
![Задание 2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/02.png)
*И, соответственно, внутри одной директории невозможно переместить файл в одноименную с файлом директорию, так как нельзя создать 2 файла с одним и тем же именем.*

---

### Задание 3

* Как посмотреть количество `inodes`?
* В каких файловых системах не может возникнуть проблемы нехватки `inodes`?

*Приведите ответ в свободной форме.*

### Ответ:
* Как посмотреть количество `inodes`?
```Bash
df -i
```
![Задание 3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/03.png)
* В каких файловых системах не может возникнуть проблемы нехватки `inodes`?
  
*`Btrfs`, `XFS`, `JFS`, `ZFS`, так как поддерживают динамическое расширение inode.*

---

### Задание 4

В задании не предполагается использование LVM.

* Подключите к системе новый диск 3ГБ.
* Создайте на нем один раздел размером 2 ГБ.
* Разметьте раздел как `xfs`.
* Смонтируйте раздел по пути /mnt. Создайте любой файл на смонтированной файловой системе. Выполните скриншот вывода команды "df -hT".
* Увеличьте раздел до 3 ГБ. 
* Расширьте файловую систему на новое свободное пространство.
* Убедитесь что созданный вами файл остался внутри раздела и файловой системы после всех манипуляций.
* Выпоните скриншот вывода команды "df -hT".

*В качестве ответа приложите выполненные два скриншота.*

### Ответ:
* Подключите к системе новый диск 3ГБ.

![Задание 4.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/04.1.png)
* Создайте на нем один раздел размером 2 ГБ.
* Разметьте раздел как `xfs`.
* Смонтируйте раздел по пути /mnt. Создайте любой файл на смонтированной файловой системе. Выполните скриншот вывода команды "df -hT".
```Bash
sudo fdisk /dev/sdb
lsblk
sudo mkfs.xfs /dev/sdb1
sudo mount /dev/sdb1 /mnt
sudo chmod 777 /mnt
echo test file for xfs > /mnt/xfs_test
cat /mnt/xfs_test
df -hT
```
![Задание 4.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/04.2.png)
* Увеличьте раздел до 3 ГБ.
* Расширьте файловую систему на новое свободное пространство.
* Убедитесь что созданный вами файл остался внутри раздела и файловой системы после всех манипуляций.
* Выпоните скриншот вывода команды "df -hT".
```Bash
sudo umount /dev/sdb1
sudo fdisk /dev/sdb
sudo mount /dev/sdb1 /mnt
sudo xfs_growfs /dev/sdb1
cat /mnt/xfs_test
df -hT
```
![Задание 4.3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/04.3.png)

---

### Задание 5*

Создайте файловую систему `Btrfs` на двух дисках размером 5Гб каждый.

*Сколько будет доступно места для работы с файлами? Сколько займут метаданные?*

### Ответ:
Создайте файловую систему `Btrfs` на двух дисках размером 5Гб каждый.
```Bash
sudo mkfs.btrfs /dev/sdb /dev/sdc
```
![Задание 5](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/05.%20Файловые%20системы/05.png)
Сколько будет доступно места для работы с файлами?

*9GiB 464MiB - для работы с файлами.*

Сколько займут метаданные?

*Метаданные занимают 112.00 KiB*

---
