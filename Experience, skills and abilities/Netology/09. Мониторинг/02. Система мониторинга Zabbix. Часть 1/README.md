# 9.2 Система мониторинга Zabbix

### Задание 1 

Установите Zabbix Server с веб-интерфейсом.

#### Процесс выполнения
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11.
3. Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.
4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.

#### Требования к результаты 
1. Прикрепите в файл README.md скриншот авторизации в админке.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/Задание%201.png)

2. Приложите в файл README.md текст использованных команд в GitHub.
```bash
sudo -i
apt update
apt install postgresql
wget https://repo.zabbix.com/zabbix/6.4/debian/pool/main/z/zabbix-release/zabbix-release_6.4-1+debian11_all.deb
dpkg -i zabbix-release_6.4-1+debian11_all.deb
apt update
apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts
su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'13579\'';"'
su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"'
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
sed -i 's/# DBPassword=/DBPassword=13579/g' /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server apache2
systemctl enable zabbix-server apache2
```
---

### Задание 2 

Установите Zabbix Agent на два хоста.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/VM's.png)

#### Процесс выполнения
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 вирт.машины, одной из них может быть ваш Zabbix Server.
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов.
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera.
5. Проверьте, что в разделе Latest Data начали появляться данные с добавленных агентов.

#### Требования к результаты 
1. Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/Задание%202.1.png)

2. Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/Задание%202.2.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/Задание%202.2.2.png)

3. Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/02.%20Система%20мониторинга%20Zabbix.%20Часть%201/screenshots/Задание%202.3.png)

4. Приложите в файл README.md текст использованных команд в GitHub
```bash
sudo -i
apt update
wget https://repo.zabbix.com/zabbix/6.4/debian/pool/main/z/zabbix-release/zabbix-release_6.4-1+debian11_all.deb
dpkg -i zabbix-release_6.4-1+debian11_all.deb
apt update
apt install zabbix-agent
sed -i 's/Server=127.0.0.1/Server=51.250.97.204/g' /etc/zabbix/zabbix_agentd.conf
# На машине с Zabbix Server добавил 'Server=127.0.0.1,51.250.97.204' в файл /etc/zabbix/zabbix_agentd.conf
systemctl restart zabbix-agent
systemctl enable zabbix-agent
```
---
