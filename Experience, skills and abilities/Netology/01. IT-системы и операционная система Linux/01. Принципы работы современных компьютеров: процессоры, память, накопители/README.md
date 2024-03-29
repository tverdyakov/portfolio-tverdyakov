# 1.1 Обзор IT-систем: принципы работы современных компьютеров
### Кейс 1.
Как вы думаете, какие принципиальные отличия есть между:
* компьютером секретаря
* рабочей станцией для работы с 3d графикой
* файловым сервером 
* сервером, выполняющим роль маршрутизатора для выхода в интернет

Напишите ответ в свободной форме.
### Ответ:
*Принципиальные отличия в аппаратном обеспечении (hardware), программном обеспечении (software), операционных системах, области применения, стоимости, гарантиях, корпусах и форм-факторах, размерах.*

*Секретарю подойдёт обычный офисный ПК, бюджетный ноутбук или планшет, системные требования которого должны подходить для работы офисных программ, интернета.*

*Для рабочей станции для работы с 3d графикой необходимы профессиональные, производительные, правильно подобранные и надежные комплектующие, подходящие для работы необходимых 3D программ.*

*Основными критериями для файлового сервера будут объем дискового пространства и скорость передачи данных, объем оперативной памяти и её тип, отказоустойчивость, пропускная способность сетевой карты.*

*Сервер, выполняющий роль маршрутизатора для выхода в интернет, тоже требователен к комплектующим и среде передачи данных.*

---
### Кейс 2.
Чем отличаются чипсет и процессор? Напишите ответ в свободной форме.
### Ответ:
*Отличия в их назначении и функциях. Процессор выполняет вычислительные и логические операции с данными. А чипсет отвечает за работу всех компонентов компьютера.*

---
### Кейс 3.
#### Какой вариант хранилища вы бы выбрали для задач ниже (3.1-3.5)?
#### Вариант хранилища:
**А)** SSD [1], **B)** HDD [2], **C)** Ленточная библиотека [3], **D)** Собственный вариант.
#### Задачи:
* 3.1 Хранилище архива проектов, расположенное на диске с общим доступом, не критично к скорости чтения, большого объёма, должно быть доступно круглосуточно
* 3.2 Сервер баз 1С с высокими требованиями по скорости доступа к диску
* 3.3 Системный диск (на котором установлена операционная система) рабочей станции, объём небольшой
* 3.4 Хранилище ежемесячных резервных копий большого объёма, носители которого должны храниться вне офиса на случай пожара и других непредвиденных ситуаций. Подлежат использованию к крайнем случае
* 3.5 Второй диск на рабочей станции, на котором пользователь хранит данные второстепенной важности

[1] **SSD** (Solid-State Drive) - это твердотельный накопитель; по сравнению с HDD твердотельные накопители имеют меньший размер и вес, являются беззвучными, а также многократно более устойчивы к повреждениям (например, к падению) и имеют гораздо бóльшую скорость записи.

[2] **HDD** (Hard (magnetic) disk drive) - запоминающее устройство, основанное на принципе магнитной записи. Является основным накопителем данных в большинстве компьютеров - тот самый классический жёсткий диск (винчестер).

[3] **Ленточная библиотека** - устройства для долговременного хранения информации на ленточных накопителях. По сравнению с дисковыми массивами они не только обеспечивают предельно низкую стоимость хранения и обладают низким уровнем энергопотребления.
### Ответ:
*|3.1 - **B** | 3.2 - **A** | 3.3 - **A** | 3.4 - **C** | 3.5 - **B** |*

---

### Кейс 4.
Существует ли возможность использовать жёсткий диск [Western Digital WD40PURZ](https://market.yandex.ru/product--zhestkii-disk-western-digital-wd40purz/1729220435) в комплекте со старой материнской платой, в которой зашит классический BIOS?
Если да, то в каком случае. Если нет, то почему? Есть ли какой-то обходной вариант? Напишите ответ в свободной форме.
### Ответ:
*Да, существует, но размер диска будет значительно ниже, 2,2 Тб, так как BIOS работает только с MBR разметкой, которая поддерживает диски менее 2,2 Тб. Это самый простой вариант, но дорогой, из-за потери ресурса памяти диска.*

*Можно использовать в качестве дополнительного диска, а ОС поставить на SSD или HDD c MBR разметкой. Для использования полного объема жесткого диска Western Digital WD40PURZ необходима GPT разметка разделов.*

*Немного посложнее вариант и не удобный, так как придется использовать флешку для загрузки ОС. Установить ОС на диск с MBR разметкой. Преобразовать таблицы разделов диска из MBR в GPT. Подготовить USB флешку и перенести загрузчик (файлы среды загрузки с системного диска) на USB флешку. Записать на USB флешку загрузочный код для обеспечения загрузки MBR. Назначить USB флешку в качестве первичного загрузочного устройства в BIOS.*

---
### Кейс 5.
Опишите процесс загрузки компьютера с момента нажатия кнопки включения и до появления рабочего стола.
Опишите этот процесс настолько детально, насколько вы это понимаете.
### Ответ:
*Нажимаем кнопку включения. Сигнал от нажатия кнопки включения поступает на материнскую плату и дает команду блоку питания дать полноценное питание всем комплектующим компьютера. Далее Чипсет загружает содержимое микросхемы BIOS в оперативную память. Включается BIOS и запускает Power On Self Test. Происходит тестирование всех комплектующих, необходимых для загрузки компьютера. Если всё исправно, то BIOS начинает искать загрузчик операционной системы. Обычно на ПК приоритет загрузки будет на HDD/SSD. Как только найден загрузчик, BIOS отправляет его в оперативную память и загрузчик начинает загрузку драйверов и необходимых файлов для запуска ОС. Последними этапами будет выгрузка ядра операционной системы в оперативную память, показ стартового экрана операционной системы и загрузка и запуск всех программ для работы. Рабочий стол.*

---
### Кейс 6.

Попробуйте узнать IP-адрес вашего компьютера из [консоли (командной строки)](https://webkyrs.info/post/chto-takoe-komandnaia-stroka-kak-ee-zapustit-na-windows-linux-i-mac) с помощью команды `ipconfig` или `ifconfig` в зависимости от ОС, либо через графический интерфейс.
Совпадает ли он с [адресом, который видит, например, Яндекс](https://internet.yandex.ru)? Как вы думаете, почему?
### Ответ:
*Нет, не совпадает. Так как внутренний адрес ip всегда отличается от внешнего ip. Внутренний предназначен для работы внутри локальных сетей, а внешний для выхода в глобальную сеть. Такой IP-адрес является уникальным, и именно благодаря ему устройство видят в сети. На такое разделение повлияла нехватка IPv4. Версия IPv4 была создана давно, когда ещё не было известно, какому количеству устройств потребуются IP-адреса. Всего может быть 4 294 967 296 адресов версии IPv4.*

---
### Кейс 7.

Какой процессор вы выберете - Intel Core i5 9600K или Intel Core i7 7700K?
Почему Intel Core i5 9600K или Intel Core i7 7700K? [Изменится ли мнение после просмотра этого сравнения?](https://cpu.userbenchmark.com/Compare/Intel-Core-i5-9600K-vs-Intel-Core-i7-7700K/4031vs3647) Опишите ход ваших мыслей.
Какую материнскую плату вы выберете для выбранного процессора?
### Ответ:
*Intel Core i5 9600K. Производительность выше, цена ниже, вышел позже, ядер больше, допустимый объем и частота оперативной памяти выше. В соотношении цены и качества Intel Core i5 9600K лучше. Не изменится, так как до этого я посмотрел сравнение на другом ресурсе.*

*Я выбрал бы MSI Z390-A PRO. Максимальный объем оперативной памяти 128 Гб, как и максимально допустимый для Intel Core i5 9600K. Есть возможность разгона.*

---
