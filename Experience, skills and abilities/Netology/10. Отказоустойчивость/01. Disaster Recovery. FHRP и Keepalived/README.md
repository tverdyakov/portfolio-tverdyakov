# 10.1 Disaster recovery и Keepalived

### Задание 1
- Дана [схема](1/hsrp_advanced.pkt) для Cisco Packet Tracer, рассматриваемая в лекции.
- На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
- Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).
- Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.
- На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.

### *Решение:*
#### Схема pkt: [hsrp_advanced-hw-1.pkt](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/hsrp_advanced-hw-1.pkt)

#### Процесс настройки маршрутизатора и проверка:
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%201.1.png)

------
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%201.2.png)

------


### Задание 2
- Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного [файла](1/keepalived-simple.conf).
- Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах
- Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.
- Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script
- На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html

### *Решение:*
#### Bash-скрипт: [check_server.sh](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/check_server.sh)

```bash
#!/bin/bash
if [[ $(netstat -ant | grep LISTEN | grep :80) ]] && [[ -f /var/www/html/index.nginx-debian.html ]]; then
  exit 0
else
  sudo systemctl stop keepalived
fi
```
#### Конфигурационный файл MASTER: [keepalived-11.conf](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/keepalived-11.conf)
```bash
vrrp_script check_server {
        script "/home/tverdyakov/check_server.sh"
        interval 3
}

vrrp_instance VI_1 {
        state MASTER
        interface enp0s3
        virtual_router_id 15
        priority 255
        advert_int 1

        virtual_ipaddress {
                192.168.123.99/24
        }

        track_script {
                check_server
        }

}
```
#### Конфигурационный файл BACKUP: [keepalived-22.conf](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/keepalived-22.conf)
```bash
vrrp_instance VI_1 {
	state BACKUP
	interface enp0s3
	virtual_router_id 15
	priority 155
	advert_int 1

	virtual_ipaddress {
		192.168.123.99/24
	}

}
```
#### Демонстрация переезда плавающего ip на другой сервер в случае недоступности порта:
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%202.4.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%202.5.png)
#### Демонстрация переезда плавающего ip на другой сервер в случае недоступности файла index.html:
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%202.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%202.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/01.%20Disaster%20Recovery.%20FHRP%20и%20Keepalived/screenshots-and-files/Задание%202.3.png)

------


