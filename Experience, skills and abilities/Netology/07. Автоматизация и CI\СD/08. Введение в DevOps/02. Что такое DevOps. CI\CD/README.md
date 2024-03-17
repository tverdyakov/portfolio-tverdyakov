# 8.2 Что такое DevOps. СI/СD

### Задание 1

**Что нужно сделать:**

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
2. Установите на машину с jenkins [golang](https://golang.org/doc/install).
3. Используя свой аккаунт на GitHub, сделайте себе форк [репозитория](https://github.com/netology-code/sdvps-materials.git). В этом же репозитории находится [дополнительный материал для выполнения ДЗ](https://github.com/netology-code/sdvps-materials/blob/main/CICD/8.2-hw.md).
4. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта ```go test .``` и  ```docker build .```.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ: 

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.1.png)

2. Установите на машину с jenkins [golang](https://golang.org/doc/install).

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.2.png)

3. Используя свой аккаунт на GitHub, сделайте себе форк [репозитория](https://github.com/netology-code/sdvps-materials.git). В этом же репозитории находится [дополнительный материал для выполнения ДЗ](https://github.com/netology-code/sdvps-materials/blob/main/CICD/8.2-hw.md).

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.3.png)

4. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта ```go test .``` и  ```docker build .```.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.4.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.5.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.6.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.7.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/01.8.png)

---

### Задание 2

**Что нужно сделать:**

1. Создайте новый проект pipeline.
2. Перепишите сборку из задания 1 на declarative в виде кода.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ: 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/02.1.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/02.2.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/02.3.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/02.4.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/02.5.png)

---

### Задание 3

**Что нужно сделать:**

1. Установите на машину Nexus.
2. Создайте raw-hosted репозиторий.
3. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
4. Загрузите файл в репозиторий с помощью jenkins.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ:

1. Установите на машину Nexus.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.1.png)

2. Создайте raw-hosted репозиторий.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.2.png)

3. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.3.png)

4. Загрузите файл в репозиторий с помощью jenkins.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.4.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.5.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.6.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.7.png)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/08.%20Введение%20в%20DevOps/02.%20Что%20такое%20DevOps.%20CI%5CCD/screenshots/03.8.png)

---
