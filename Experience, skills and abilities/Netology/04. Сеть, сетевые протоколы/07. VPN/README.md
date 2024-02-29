# 4.7 Сеть и сетевые протоколы: VPN
 
### Инструкция по выполнению: 
- Сделайте скриншоты из Cisco Packet Tracer по итогам выполнения задания 
- Отправьте на проверку в личном кабинете Нетологии скриншоты. Файлы прикрепите в раздел "решение" в практическом задании.
- В комментариях к решению в личном кабинете Нетологии напишите пояснения к полученным результатам. 

---

## Задание. Создание дополнительного офиса и настройка ISAKMP-туннеля для согласования параметров протокола.

### Описание задания
Руководство решило открыть новый филиал в соседней области. Перед вами стоит задача  между главным офисом и филиалом создать VPN-туннель. Новый филиал подключен к тому же интернет-провайдеру. Но имеет другие “белые” ip-адреса для подключения: 87.250.0.0/30

### Требование к результату
- Вы должны отправить файл .pkt с выполненным заданием
- К выполненной задаче добавьте скриншоты с доступностью “внешней сети” и ответы на вопросы.

### Процесс выполнения
1. Запустите программу Cisco Packet Tracer
2. В программе Cisco Packet Tracer загрузите предыдущую практическую работу.
3. На маршрутизаторе интернет-провайдера добавьте в модуль физически порты GLC-TE, предварительно его выключив.
4. Создайте сеть нового филиала, состоящую из 3 ПК, 1 коммутатора и 1 маршрутизатора.
5. Создайте сетевую связность между маршрутизатором филиала и маршрутизатором интернет-провайдера, согласно условиям.
6. На маршрутизаторе филиала создайте NAT-трансляцию с помощью access-листов для внутренней сети. Адресацию внутри сети филиала можно использовать любую.
7. На маршрутизаторе главного офиса настройте политики ISAKMP: 

*R1(config)#  crypto isakmp policy 1*

*R1(config-isakmp)# encr 3des - метод шифрования*

*R1(config-isakmp)# hash md5 - алгоритм хеширования*

*R1(config-isakmp)# authentication pre-share - использование предварительного общего ключа (PSK) в качестве метода проверки подлинности*

*R1(config-isakmp)# group 2 - группа Диффи-Хеллмана, которая будет использоваться*

*R1(config-isakmp)# lifetime 86400 - время жизни ключа сеанса*

8. Укажите Pre-Shared ключ для аутентификации с маршрутизатором филиала. Проверьте доступность с любого конечного устройства доступность роутера интернет-провайдера, командой ping.
9. Создайте набор преобразования (Transform Set), используемого для защиты наших данных.

*crypto ipsec transform-set <название> esp-3des esp-md5-hmac*

10. Создайте крипто-карту с указанием внешнего ip-адреса интерфейса и привяжите его к интерфейсу.

*R1(config)# crypto map <название> 10 ipsec-isakmp*

*R1(config-crypto-map)# set peer <ip-address>*

*R1(config-crypto-map)# set transform-set <название>*

*R1(config-crypto-map)# match address <название access-листа>*

*R1(config- if)# crypto map <название крипто-карты>*

10. Проделайте вышеуказанные операции на маршрутизаторе филиала в соответствии ip-адресов и access-листов и отключите NAT-трансляцию сетевых адресов.
11. Проверьте сетевую доступность между роутерами командой ping.
12. Проверьте установившееся VPN-соединение на каждом роутере командой: “show crypto session”. Статус должен быть UP-ACTIVE. Сделайте скриншот.
13. Ответ внесите в комментарии к решению задания в личном кабинете Нетологии

### Топология после выполнения задания должна выглядеть следующим образом:
[![](https://i.postimg.cc/SRYBKKtR/oYEo8eD2.jpg)](https://postimg.cc/T5G77Txv)

### Ответ:

[VPN.pkt](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/VPN.pkt)

- Статусы VPN-соединений

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/01.1.png)

- Статусы VPN-соединений

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/01.2.png)

- Доступность сетей двух офисов

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/02.1.png)

- Доступность сетей двух офисов

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/02.2.png)

- Настройки конфигурации VPN

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/03.1.png)

- Настройки конфигурации VPN

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/04.%20Сеть%2C%20сетевые%20протоколы/07.%20VPN/screenshots-and-files/03.2.png)
 
---
