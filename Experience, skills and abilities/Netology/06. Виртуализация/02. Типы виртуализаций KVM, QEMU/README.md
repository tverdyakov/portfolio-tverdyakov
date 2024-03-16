# 6.2 Типы виртуализации: KVM, QEMU

### Задание 1

**Ответьте на вопрос в свободной форме.**

Какие виртуализации существуют? Приведите примеры продуктов разных типов виртуализации.

### Ответ:

- Аппаратная виртуализация. VT-x, VT-d, AMD-V, EL2.
- Программная виртуализация. VirtualBox, KVM, QEMU, HYPER-V, XEN.
- Контейнерная виртуализация. Docker, Kubernetes.
- Хостинговая виртуализация. Yandex Cloud, VK Cloud.

---

### Задание 2 

Выполните действия и приложите скриншоты по каждому этапу:

1. Установите QEMU в зависимости от системы (в лекции рассматривались примеры).
2. Создайте виртуальную машину.
3. Установите виртуальную машину.
Можете использовать пример [по ссылке](https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/x86/alpine-standard-3.13.5-x86.iso).

Пример взят [с сайта](https://alpinelinux.org). 

### Ответ:

1. Установите QEMU в зависимости от системы (в лекции рассматривались примеры).

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/02.1.png)

2. Создайте виртуальную машину.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/02.2.png)

3. Установите виртуальную машину.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/02.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/02.4.png)

---

### Задание 3 

Выполните действия и приложите скриншоты по каждому этапу:

1. Установите KVM и библиотеку libvirt. Можете использовать GUI-версию из лекции. 
2. Создайте виртуальную машину. 
3. Установите виртуальную машину. 
Можете использовать пример [по ссылке](https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/x86/alpine-standard-3.13.5-x86.iso). 

Пример взят [с сайта](https://alpinelinux.org). 

### Ответ:

1. Установите KVM и библиотеку libvirt. Можете использовать GUI-версию из лекции. 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/03.1.png)

2. Создайте виртуальную машину. 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/03.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/03.3.png)

3. Установите виртуальную машину. 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/03.4.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/03.5.png)

 ---

### Задание 4

Выполните действия и приложите скриншоты по каждому этапу:

1. Создайте проект в GNS3, предварительно установив [GNS3](https://github.com/GNS3/gns3-gui/releases).
2. Создайте топологию, как на скрине ниже.
3. Для реализации используйте машину на базе QEMU. Можно дублировать, сделанную ранее. 

![image](https://user-images.githubusercontent.com/73060384/118615008-f95e9680-b7c8-11eb-9610-fc1e73d8bd70.png)

### Ответ:

1. Создайте проект в GNS3, предварительно установив [GNS3](https://github.com/GNS3/gns3-gui/releases).

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/04.1.png)

2. Создайте топологию, как на скрине ниже.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/04.2.png)

3. Для реализации используйте машину на базе QEMU. Можно дублировать, сделанную ранее. 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/02.%20Типы%20виртуализаций%20KVM%2C%20QEMU/screenshots/04.3.png)

---
