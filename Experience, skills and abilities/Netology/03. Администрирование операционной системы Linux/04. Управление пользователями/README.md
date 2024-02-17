# 3.4 Управление пользователями

### Задание 1.

Создайте пользователя `student1` с оболочкой bash, входящего в группу `student1`.

Создайте пользователя `student2`, входящего в группу `student2`.

*Приведите ответ в виде снимков экрана.*

#### *Ответ:*
```Bash
sudo useradd -s /bin/bash -U student1
cat /etc/passwd | grep student1
cat /etc/group | grep student1
sudo useradd -s /bin/bash -U student2
cat /etc/passwd | grep student2
cat /etc/group | grep student2
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/04.%20Управление%20пользователями/01.png)

---

### Задание 2.

Создайте в общем каталоге (например, /tmp) директорию и назначьте для неё полный доступ со стороны группы `student2` и доступ на чтение всем остальным

*Приведите ответ в виде снимков экрана.*

#### *Ответ:*
```Bash
sudo mkdir /tmp/stu
sudo chgrp student2 /tmp/stu
ls -l /tmp | grep stu
sudo chmod 774 /tmp/stu
ls -l /tmp | grep stu
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/04.%20Управление%20пользователями/02.png)

---

### Задание 3.

Какой режим доступа установлен для файлов `/etc/passwd` и `/etc/shadow`?

Объясните, зачем понадобилось именно два файла?

*Приведите ответ в свободной форме.*

#### *Ответ:*
*Для файла `/etc/passwd` установлен режим доступа:*

`u – rw-; g – r--; o – r--.`

*То есть для пользователя root установлен режим доступа на чтение и запись. Для группы root и всех остальных установлен режим доступа на чтение.*

*Для файла `/etc/shadow` установлен режим доступа:*

`u – rw-; g – r--; o – ---.`

*То есть для пользователя root установлен режим доступа на чтение и запись. Для группы shadow установлен режим доступа на чтение. Для всех остальных пользователей доступ запрещен.*

*Два файла понадобилось для повышения безопасности. Хеши паролей хранятся в файле shadow, доступ к которому есть только у пользователя root и группы shadow. Для всех остальных пользователей доступ запрещен.*
```Bash
ls -l /etc/passwd
ls -l /etc/shadow
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/04.%20Управление%20пользователями/03.png)

---

### Задание 4.

Удалите группу `student2`, а пользователя `student2` добавьте в группу `student1`.

*Приведите ответ в виде снимков экрана.*

#### *Ответ:*
```Bash
sudo usermod -g student1 student2
sudo groupdel student2
cat /etc/passwd | grep student
cat /etc/group | grep student
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/04.%20Управление%20пользователями/04.png)

---

### Задание 5.

Создайте в общем каталоге (например, /tmp) директорию и назначьте для неё полный доступ для всех, кроме группы `student1`.  Группа `student1` не должна иметь доступа к содержимому этого каталога.

*Приведите ответ в виде снимков экрана.*

#### *Ответ:*
```Bash
sudo mkdir /tmp/not_for_student1
sudo chgrp student1 /tmp/not_for_student1
sudo chmod 707 /tmp/not_for_student1
ls -l /tmp | grep not_for_student1
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/03.%20Администрирование%20операционной%20системы%20Linux/04.%20Управление%20пользователями/05.png)

---
