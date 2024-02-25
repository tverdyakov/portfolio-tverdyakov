# 5.5 Разбор скриптов и и их написание

### Задание 1.

Дан скрипт:

```bash
#!/bin/bash
PREFIX="${1:-NOT_SET}"
INTERFACE="$2"

[[ "$PREFIX" = "NOT_SET" ]] && { echo "\$PREFIX must be passed as first positional argument"; exit 1; }
if [[ -z "$INTERFACE" ]]; then
    echo "\$INTERFACE must be passed as second positional argument"
    exit 1
fi

for SUBNET in {1..255}
do
	for HOST in {1..255}
	do
		echo "[*] IP : ${PREFIX}.${SUBNET}.${HOST}"
		arping -c 3 -i "$INTERFACE" "${PREFIX}.${SUBNET}.${HOST}" 2> /dev/null
	done
done
```


Измените скрипт так, чтобы:

- для ввода пользователем были доступны все параметры. Помимо существующих PREFIX и INTERFACE, сделайте возможность задавать пользователю SUBNET и HOST;
- скрипт должен работать корректно в случае передачи туда только PREFIX и INTERFACE
- скрипт должен сканировать только одну подсеть, если переданы параметры PREFIX, INTERFACE и SUBNET
- скрипт должен сканировать только один IP-адрес, если переданы PREFIX, INTERFACE, SUBNET и HOST
- не забывайте проверять вводимые пользователем параметры с помощью регулярных выражений и знака `~=` в условных операторах 
- проверьте, что скрипт запускается с повышенными привилегиями и сообщите пользователю, если скрипт запускается без них

### Ответ:
```bash
#!/bin/bash

PREFIX="$1"
INTERFACE="$2"
ROOTUSER_NAME="root"
username=$(id -nu)
if [ "$username" != "$ROOTUSER_NAME" ]; then
  echo "Must be root to run \"$(basename "$0")\"."
  exit 1
fi

trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

if [[ -z "$PREFIX" ]]; then
  echo "\$PREFIX must be passed as first positional argument."
  exit 1;
fi

if [[ -z "$INTERFACE" ]]; then
  echo "\$INTERFACE must be passed as second positional argument."
  exit 1
fi

prefix_test='^((25[0-5]|(2[0-4]|1[0-9]|[1-9]|)[0-9])\.?\b){2,4}$'
if ! [[ $PREFIX =~ $prefix_test ]]; then
  echo "Incorrect input \$PREFIX, please try again."
  exit 1
fi

if [[ ! $(ls /sys/class/net) =~ $INTERFACE ]]; then
  echo "Interface $INTERFACE doesn't exists, please try again."
  exit 1
fi

IP=$(cut -s -d. -f1,2 <<< "$PREFIX")
tmp="$(cut -s -d. -f3 <<< "$PREFIX")"
RANGE=({0..255})
SUBNET="${tmp:-${RANGE[@]}}"
tmp="$(cut -s -d. -f4 <<< "$PREFIX")"
HOST="${tmp:-${RANGE[@]}}"

for SUBNET in $SUBNET; do
  for HOST in $HOST; do
    echo "[*] IP : ${IP}.${SUBNET}.${HOST}"
    arping -c 3 -I "$INTERFACE" "${IP}.${SUBNET}.${HOST}" 2> /dev/null
  done
done
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/05.%20Разбор%20скриптов%20и%20их%20написание/01.1.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/05.%20Разбор%20скриптов%20и%20их%20написание/01.2.png)

---
