# 2.4 Дисковые системы

### Задание 1

Какие виды RAID увеличивают производительность дисковой системы?

*Приведите ответ в свободной форме.*

### Ответ:
* RAID 0
* RAID 10
* RAID 50
* RAID 60
* RAID 1, RAID 3, RAID 4, RAID 5, RAID 6, но только на чтение.

---

### Задание 2

Влияет ли количество операций ввода-вывода на параметр `load average`?

*Приведите развернутый ответ в свободной форме.*

### Ответ:

Да, влияет с 1993 года.

load average показывает среднее количество процессов, находящихся в запущенном и непрерывном состоянии в единицу времени. То есть показывает нагрузку.

Нашел информацию в статье: https://bjdarticles.blogspot.com/2019/07/httpwww.html

Там есть ссылка на патч: http://oldlinux.org/Linux.old/mail-archive/alan-old-funet-lists/

> From: Matthias Urlichs <urlichs@smurf.sub.org>
>
> Subject: Load average broken ?
>
> Date: Fri, 29 Oct 1993 11:37:23 +0200
>
> The kernel only counts "runnable" processes when computing the load average. I don't like that; the problem is that processes which are swapping or waiting on "fast", i.e. noninterruptible, I/O, also consume resources.
> 
> It seems somewhat nonintuitive that the load average goes down when you replace your fast swap disk with a slow swap disk...
> 
> Anyway, the following patch seems to make the load average much more consistent WRT the subjective speed of the system. And, most important, the load is still zero when nobody is doing anything. ;-)
 
Перевод:

> *"Ядро учитывает только "выполняемые" процессы при вычислении средней нагрузки. Мне это не нравится, потому что процессы, использующие своп или ожидающие "быстрого" (т.е. непрерывного) ввода/вывода также потребляют ресурсы.*
>
> *Это кажется несколько не интуитивным, что средняя нагрузка снижается, когда заменить быстрый диск подкачки на медленный.*
>
> *В любом случае, следующий патч, похоже, сделает среднюю нагрузку более согласованной субъективной скорости системы, и, самое важное, нагрузка по прежнему равна нулю, когда никто ничего не делает."*

---

### Задание 3

Подключите к виртуальной машине 2 новых диска. 

1)На первом диске создайте таблицу разделов MBR, Создайте 4 раздела: первый раздел на 50% диска, остальные любого размера на ваше усмотрение. Хотя бы один из разделов должен быть логическим.

2)На втором диске создайте таблицу разделов GPT. Создайте 4 раздела: первый раздел на 50% диска, остальные любого размера на ваше усмотрение.

*В качестве ответа приложите скриншоты, на которых было бы видно разметку диска(например, командами lsblk -a; fdisk -l)*

### Ответ:

Подключите к виртуальной машине 2 новых диска. 
![Задание 3.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/03.1.png)
1)На первом диске создайте таблицу разделов MBR, Создайте 4 раздела: первый раздел на 50% диска, остальные любого размера на ваше усмотрение. Хотя бы один из разделов должен быть логическим.
![Задание 3.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/03.2.png)
2)На втором диске создайте таблицу разделов GPT. Создайте 4 раздела: первый раздел на 50% диска, остальные любого размера на ваше усмотрение.
![Задание 3.3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/03.3.png)

---

### Задание 4

Создайте программный RAID 1 в вашей ОС используя программу `mdadm`.

Демонстрация работы утилиты была на лекции. Объем RAID неважен.

*В качестве ответа приложите скриншот вывода команды `mdadm -D /dev/md0`, где md0 - это название вашего рейд массива(может быть любым).*

### Ответ:
```Bash
sudo mdadm --zero-superblock --force /dev/sd{b,c}
sudo wipefs --all --force /dev/sd{b,c}
sudo mdadm --create --verbose /dev/md123 -l 1 -n 2 /dev/sd{b,c}
sudo mkfs.ext4 /dev/md123
mount /dev/md123 /mnt
```
Чтобы данный раздел монтировался при загрузке системы, узнаем UUID через blkid и добавляем в `/etc/fstab`:

`UUID="7ddc6b7f-e780-6235-3218-25bff6dffd5c"    /mnt    ext4    defaults    0 0`

![Задание 4.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/04.1.png)
![Задание 4.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/04.2.png)

---

### Задание 5

* Сделайте скриншоты вывода комманд df -h, pvs, lvs, vgs;
* подключите к ОС 2 новых диска;
* создайте новую VG, добавьте в него 1 диск;
* создайте 2 LV, распределите доступное пространство между ними поровну;
* создайте на обоих томах файловую систему `xfs`;
* создайте две точки монтирования и смонтируйте каждый из томов;
* сделайте скриншот вывода комманд df -h;
* добавьте в VG второй оставшийся диск;
* расширьте первый LV на объем нового диска;
* расширьте файловую систему на размер нового доступного пространства;
* сделайте скриншоты вывода комманд df -h, pvs, lvs, vgs.

*В качестве ответа приложите созданные скриншоты и скриншоты выполнения.*

### Ответ:

* Сделайте скриншоты вывода комманд df -h, pvs, lvs, vgs;

![Задание 5.1](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.1.png)
* подключите к ОС 2 новых диска;
```Bash
lsblk
```
![Задание 5.2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.2.png)
* создайте новую VG, добавьте в него 1 диск;
```Bash
sudo pvcreate /dev/sdb /dev/sdc
sudo vgcreate vgnew /dev/sdb
```
![Задание 5.3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.3.png)
* создайте 2 LV, распределите доступное пространство между ними поровну;
```Bash
sudo lvcreate  -l 50%VG -n lvnew vgnew
sudo lvcreate  -l 50%VG -n lvnew1 vgnew
```
![Задание 5.4](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.4.png)
* создайте на обоих томах файловую систему `xfs`;
```Bash
sudo mkfs.xfs /dev/vgnew/lvnew
sudo mkfs.xfs /dev/vgnew/lvnew1
```
![Задание 5.5](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.5.png)
* создайте две точки монтирования и смонтируйте каждый из томов;
```Bash
sudo mkdir /mnt/disk1
sudo mkdir /mnt/disk2
sudo mount /dev/vgnew/lvnew /mnt/disk1
sudo mount /dev/vgnew/lvnew /mnt/disk2
```
![Задание 5.6](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.6.png)
* сделайте скриншот вывода комманд df -h;

![Задание 5.7](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.7.png)
* добавьте в VG второй оставшийся диск;
```Bash
sudo vgextend vgnew /dev/sdc
```
![Задание 5.8](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.8.png)
* расширьте первый LV на объем нового диска;
```Bash
sudo lvextend -l +100%FREE /dev/vgnew/lvnew
```
![Задание 5.9](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.9.png)
* расширьте файловую систему на размер нового доступного пространства;
```Bash
sudo xfs_growfs /dev/vgnew/lvnew
```
![Задание 5.10](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.10.png)
* сделайте скриншоты вывода комманд df -h, pvs, lvs, vgs.

![Задание 5.11](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/04.%20Дисковые%20системы/05.11.png)

---
