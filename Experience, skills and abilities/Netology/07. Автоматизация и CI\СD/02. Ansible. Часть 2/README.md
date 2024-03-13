# 7.2 Ansible.Часть 2

### Задание 1

**Выполните действия, приложите файлы с плейбуками и вывод выполнения.**

Напишите три плейбука. При написании рекомендуем использовать текстовый редактор с подсветкой синтаксиса YAML.

Плейбуки должны: 

1. Скачать какой-либо архив, создать папку для распаковки и распаковать скаченный архив. Например, можете использовать [официальный сайт](https://kafka.apache.org/downloads) и зеркало Apache Kafka. При этом можно скачать как исходный код, так и бинарные файлы, запакованные в архив — в нашем задании не принципиально.
2. Установить пакет tuned из стандартного репозитория вашей ОС. Запустить его, как демон — конфигурационный файл systemd появится автоматически при установке. Добавить tuned в автозагрузку.
3. Изменить приветствие системы (motd) при входе на любое другое. Пожалуйста, в этом задании используйте переменную для задания приветствия. Переменную можно задавать любым удобным способом.

### Ответ:

1. Скачать какой-либо архив, создать папку для распаковки и распаковать скаченный архив. Например, можете использовать [официальный сайт](https://kafka.apache.org/downloads) и зеркало Apache Kafka. При этом можно скачать как исходный код, так и бинарные файлы, запакованные в архив — в нашем задании не принципиально.

[playbook-7-2-1.1.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/playbook-7-2-1.1.yml)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.2.png)

2. Установить пакет tuned из стандартного репозитория вашей ОС. Запустить его, как демон — конфигурационный файл systemd появится автоматически при установке. Добавить tuned в автозагрузку.

[playbook-7-2-1.2.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/playbook-7-2-1.2.yml)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.4.png)

3. Изменить приветствие системы (motd) при входе на любое другое. Пожалуйста, в этом задании используйте переменную для задания приветствия. Переменную можно задавать любым удобным способом.

[playbook-7-2-1.3.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/playbook-7-2-1.3.yml)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.6.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/01.7.png)

---

### Задание 2

**Выполните действия, приложите файлы с модифицированным плейбуком и вывод выполнения.** 

Модифицируйте плейбук из пункта 3, задания 1. В качестве приветствия он должен установить IP-адрес и hostname управляемого хоста, пожелание хорошего дня системному администратору. 

### Ответ:

[playbook-7-2-2.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/playbook-7-2-2.yml)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/02.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/02.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/02.3.png)

---

### Задание 3

**Выполните действия, приложите архив с ролью и вывод выполнения.**

Ознакомьтесь со статьёй [«Ansible - это вам не bash»](https://habr.com/ru/post/494738/), сделайте соответствующие выводы и не используйте модули **shell** или **command** при выполнении задания.

Создайте плейбук, который будет включать в себя одну, созданную вами роль. Роль должна:

1. Установить веб-сервер Apache на управляемые хосты.
2. Сконфигурировать файл index.html c выводом характеристик каждого компьютера как веб-страницу по умолчанию для Apache. Необходимо включить CPU, RAM, величину первого HDD, IP-адрес.
Используйте [Ansible facts](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html) и [jinja2-template](https://linuxways.net/centos/how-to-use-the-jinja2-template-in-ansible/). Необходимо реализовать handler: перезапуск Apache только в случае изменения файла конфигурации Apache.
4. Открыть порт 80, если необходимо, запустить сервер и добавить его в автозагрузку.
5. Сделать проверку доступности веб-сайта (ответ 200, модуль uri).

В качестве решения:
- предоставьте плейбук, использующий роль;
- разместите архив созданной роли у себя на Google диске и приложите ссылку на роль в своём решении;
- предоставьте скриншоты выполнения плейбука;
- предоставьте скриншот браузера, отображающего сконфигурированный index.html в качестве сайта.

### Ответ:

[playbook-7-2-3.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/playbook-7-2-3.yml)

[tasks/main.yml](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/main.yml)

[template/index.j2](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/index.j2)

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/03.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/03.5.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/03.6.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/03.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/07.%20Автоматизация%20и%20CI%5CСD/02.%20Ansible.%20Часть%202/screenshots/03.3.png)

---
