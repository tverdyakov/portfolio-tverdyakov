# 10.3 Резервное копирование

### Задание 1
- Составьте команду rsync, которая позволяет создавать зеркальную копию домашней директории пользователя в директорию `/tmp/backup`
- Необходимо исключить из синхронизации все директории, начинающиеся с точки (скрытые)
- Необходимо сделать так, чтобы rsync подсчитывал хэш-суммы для всех файлов, даже если их время модификации и размер идентичны в источнике и приемнике.
- На проверку направить скриншот с командой и результатом ее выполнения

### *Решение:*
```bash
rsync -a --checksum --verbose --delete --progress --exclude '.*' /home/tverdyakov/ /tmp/backup
```
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%201.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%201.2.png)



### Задание 2
- Написать скрипт и настроить задачу на регулярное резервное копирование домашней директории пользователя с помощью rsync и cron.
- Резервная копия должна быть полностью зеркальной
- Резервная копия должна создаваться раз в день, в системном логе должна появляться запись об успешном или неуспешном выполнении операции
- Резервная копия размещается локально, в директории `/tmp/backup`
- На проверку направить файл crontab и скриншот с результатом работы утилиты.

### *Решение:*
#### Файл crontab: [crontab](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/crontab)
### Результат работы утилиты
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%202.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%202.2.png)

### Проверка работы скрипта и утилиты
#### Cкрипт: [every_day_backup.sh](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/every_day_backup.sh)
```bash
#!/bin/bash
copy=$1
paste=$2

if [ ! -d $copy ]; then
	echo -e "\033[31m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Unsuccessfully! | Source directory does not exist. | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
elif [ ! -d $paste ]; then
	echo -e "\033[31m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Unsuccessfully! | Destination directory does not exist. | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
else
	rsync -a --checksum --verbose --delete --progress --exclude '.*' $copy $paste >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
  echo -e "\033[32m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Successfully! | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
fi
```
#### Файл crontab
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%202.3.png)

### Результат
#### Файл rsync-cron-2023-08-26.log: [rsync-cron-2023-08-26.log](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/rsync-cron-2023-08-26.log)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/03.%20Резервное%20копирование/screenshots-and-files/Задание%202.4.png)

---
