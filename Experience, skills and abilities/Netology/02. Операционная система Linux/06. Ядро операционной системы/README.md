# 2.6 Ядро операционной системы


### Задание 1

При каких событиях выполнение процесса переходит в режим ядра?

*Приведите ответ в свободной форме.*

### Ответ:
*При системных вызовах и аппаратных прерываниях.*

---

### Задание 2

Найдите имя автора модуля `libcrc32c`.

*В качестве ответа приложите скриншот вывода команды.*

### Ответ:
```Bash
sudo modinfo libcrc32c
```
![Задание 2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/06.%20Ядро%20операционной%20системы/02.png)

---
### Задание 3

Используя утилиту `strace` выясните какой системный вызов использует команда `cd`.

*Примечание:* она не является внешним файлом, но для наших целей можно схитрить: `strace bash -c 'cd /tmp'`.

*В качестве ответа напишите название системного вызова.*

### Ответ:
`chdir`
![Задание 3](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/06.%20Ядро%20операционной%20системы/03.png)

---

### Задание 4

**Соберите свой модуль и загрузите его в ядро.**

*Примечание:* лучше использовать чистую виртуальную машину, чтобы нивелировать шанс сломать систему.

**1) Установим необходимые пакеты:**

`apt-get install gcc make linux-headers-$(uname -r)`

**2) Создаем файл модуля:**

```
mkdir kmod-hello_world
cd kmod-hello_world/
touch ./mhello.c
```

```
#define MODULE
#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPLv3");

int init_module(void){
    printk("<1> Hello,World\n");
    return 0;
}

void cleanup_module(void){
    printk("<1> Goodbye.\n");
}
```

**3) Создаем Makefile:**
`touch ./Makefile`

```
obj-m += mhello.o

hello-objs := mhello.c

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
```
_Обратите внимание, что отступы перед `make` - это табуляция, а не пробелы. Для синтаксиса Makefile это важно._

**4) Собираем модуль и устанавливаем его с помощью insmod.**
```
make all
insmod path/to/module.ko
```

*В качестве ответа приложите скриншот вывода установки модуля в `dmesg`.*

### Ответ:
![Задание 4](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/06.%20Ядро%20операционной%20системы/04.1.png)
![Задание 4](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/02.%20Операционная%20система%20Linux/06.%20Ядро%20операционной%20системы/04.2.png)

---
