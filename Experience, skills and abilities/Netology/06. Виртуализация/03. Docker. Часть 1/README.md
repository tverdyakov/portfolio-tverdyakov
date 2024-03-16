# 6.3 Docker. Часть 1

### Задание 1

**Ответьте на вопрос в свободной форме.** 

Чем контейнеризация отличается от виртуализации?

### Ответ:

Принципом работы, скоростью, размером, стоимостью ресурсов, безопасностью. 

Так как контейнеры - это виртуализация на уровне операционной системы, то есть используют операционную систему и ядро основного хоста, а исполняемый файл имеет все библиотеки и зависимость, то контейнеры не перегружены лишними накладными расходами (на эмуляцию виртуального оборудования, запуск полноценного экземпляра операционной системы). Из этого следует, что размер контейнера меньше, чем размер виртуальной машины, скорость запуска и работы выше, требуют меньше ресурсов, снижают затраты на сервер и лицензирование, и безопасны, так как контейнерные приложения изолированы друг от друга и система управления не даст распространиться вирусу за пределы контейнера.

---

### Задание 2 

**Выполните действия:**

1. Установите Docker.
2. Приложите скриншот.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/02.png)

---

### Задание 3

**Выполните действия:**

1. Запустите образ hello-world.
2. Приложите скриншот.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/03.png)

---

### Задание 4 

**Выполните действия:**

1. Удалите образ hello-world.
2. Приложите скриншот.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/04.png)

---

### Задание 5*

1. Найдите в Docker Hub образ apache и запустите его.
2. Приложите:
 * скриншоты сетевых настроек вашей виртуальной машины;
 * скриншоты работающих контейнеров;
 * скриншот браузера, где вы открыли дефолтную страницу вашего apache внутри контейнера.

### Ответ:

1. Найдите в Docker Hub образ apache и запустите его.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/05.1.png)

2. Приложите:

 * скриншоты сетевых настроек вашей виртуальной машины;

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/05.2.png)
 
 * скриншоты работающих контейнеров;

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/05.3.png)
 
 * скриншот браузера, где вы открыли дефолтную страницу вашего apache внутри контейнера.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/05.4.png)

---

### Задание 6*

1. Создайте свой Docker образ с Apache2 и подмените стандартную страницу index.html на страницу, содержащую ваши ФИО.
2. Приложите:
 * скриншот содержимого Dockerfile;
 * скриншот браузера, где apache2 из вашего контейнера выводит ваши ФИО.

### Ответ:

 * скриншот содержимого Dockerfile;

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/06.1.png)

 * скриншот браузера, где apache2 из вашего контейнера выводит ваши ФИО.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/03.%20Docker.%20Часть%201/screenshots/06.2.png)

---
