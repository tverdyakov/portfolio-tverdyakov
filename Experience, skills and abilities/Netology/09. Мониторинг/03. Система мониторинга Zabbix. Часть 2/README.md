# 9.3 Система мониторинга Zabbix. Часть 2

### Задание 1
Создайте свой шаблон, в котором будут элементы данных, мониторящие загрузку CPU и RAM хоста.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. В веб-интерфейсе Zabbix Servera в разделе Templates создайте новый шаблон
3. Создайте Item который будет собирать информацию об загрузке CPU в процентах
4. Создайте Item который будет собирать информацию об загрузке RAM в процентах

#### Требования к результату
- [ ] Прикрепите в файл README.md скриншот страницы шаблона с названием «Задание 1»

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%201.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%201.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%201.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%201.4.png)

 ---

### Задание 2
Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera
5. Прикрепите за каждым хостом шаблон Linux by Zabbix Agent
6. Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов

#### Требования к результату
- [ ] Результат данного задания сдавайте вместе с заданием 3

 ---

### Задание 3
Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Зайдите в настройки каждого хоста и в разделе Templates прикрепите к этому хосту ваш шаблон
3. Так же к каждому хосту привяжите шаблон Linux by Zabbix Agent
4. Проверьте что в раздел Latest Data начали поступать необходимые данные из вашего шаблона

#### Требования к результату
- [ ] Прикрепите в файл README.md скриншот страницы хостов, где будут видны привязки шаблонов с названиями «Задание 2-3». Хосты должны иметь зелёный статус подключения

## Результат задания 2

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%202.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%202.2.png)

## Результат задания 3
Во втором задании к хостам уже был привязан шаблон Linux by Zabbix Agent c ключом vm.memory.size[pavailable], который тоже есть в созданном шаблоне Task 1 из первого задания. Соответственно, нет возможности без отвязки шаблона Linux by Zabbix Agent привязать шаблон Task 1. 

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%203.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%203.2.png)

Отвязал шаблон Linux by Zabbix Agent и привязал к хостам созданный шаблон Task 1.

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%203.3.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%203.4.png)

 ---

### Задание 4
Создайте свой кастомный дашборд.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. В разделе Dashboards создайте новый дашборд
3. Разместите на нём несколько графиков на ваше усмотрение.

#### Требования к результату
- [ ] Прикрепите в файл README.md скриншот дашборда с названием «Задание 4»

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/09.%20Мониторинг/03.%20Система%20мониторинга%20Zabbix.%20Часть%202/screenshots/Задание%204.png)

 ---
