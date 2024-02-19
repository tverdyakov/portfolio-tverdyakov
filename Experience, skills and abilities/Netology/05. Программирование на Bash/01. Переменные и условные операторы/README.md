# 5.1 Переменные и условные операторы

### Задание 1.

Напишите скрипт, который при запуске спрашивает у пользователя путь до директории и создает ее при условии, что ее еще не существует. 

Если директория существует – пользователю выводится сообщение, что директория существует.

Скрипт должен принимать абсолютный путь до директории, например `/tmp/testdir` или `/home/user/testdir`

#### *Ответ:*
```bash
#!/bin/bash
echo "Введите абсолютный путь до директории:"
read way
if [[ ! -d $way ]]; then
  mkdir -v -p $way
else
  echo "Директория $way существует. Придумайте другое название." && /bin/bash /home/tverdyakov/5-1-1.sh
fi

```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/01.1.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/01.2.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/01.3.png)

---

### Задание 2.

Напишите скрипт:
1. При запуске скрипта пользователь вводит два числа.
2. Необходимо вычесть из большего числа меньшее и вывести результат в консоль.
3. Если числа равны – умножить их друг на друга (или возвести в квадрат одно из чисел) и вывести результат в консоль.

#### *Ответ:*
```bash
#!/bin/bash
echo "Введите два числа:"
read first second
if [[ $first -gt $second ]]; then
  a=$(($first - $second)) && echo $a
elif [[ $first -lt $second ]]; then
  a=$(($second - $first)) && echo $a
else
  a=$(($first * $second)) && echo $a
fi
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/02.1.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/02.2.png)

---

### Задание 3.

Напишите скрипт с использованием оператора `case`:
1. При запуске скрипта пользователь вводит в консоль имя файла с расширением, например 123.jpg или track.mp3.
2. Необходимо сообщить пользователю тип файла:
- Если jpg, gif или png – вывести слово «image»
- Если mp3 или wav – вывести слово «audio»
- Если txt или doc – вывести слово «text»
- Если формат не подходит под заданные выше – написать «unknown»

#### *Ответ:*
```bash
#!/bin/bash
echo "Введите имя файла с расширением:"
read name
case "$name" in
*.jpg | *.png | *.gif)
  type="image" && echo "Тип файла - $type"
  ;;
*.mp3 | *.wav)
  type="audio" && echo "Тип файла - $type"
  ;;
*.txt | *.doc)
  type="text" && echo "Тип файла - $type"
  ;;
*)
  type="unknow" && echo "Тип файла - $type"
  ;;
esac
```
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/03.1.png)
![](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/05.%20Программирование%20на%20Bash/01.%20Переменные%20и%20условные%20операторы/03.2.png)

---
