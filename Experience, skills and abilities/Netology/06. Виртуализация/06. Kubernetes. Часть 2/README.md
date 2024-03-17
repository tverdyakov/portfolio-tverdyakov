# 6.6 Kubernetes. Часть 2

### Задание 1

**Выполните действия:**

1. Создайте свой кластер с помощью kubeadm.
2. Установите любой понравившийся CNI плагин.
3. Добейтесь стабильной работы кластера.

В качестве ответа пришлите скриншот результата выполнения команды `kubectl get po -n kube-system`.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/06.%20Kubernetes.%20Часть%202/01.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/06.%20Kubernetes.%20Часть%202/01.2.png)

---

### Задание 2

Есть файл с деплоем:

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis
spec:
  selector:
    matchLabels:
      app: redis
  replicas: 1
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
      - name: master
        image: bitnami/redis
        env:
         - name: REDIS_PASSWORD
           value: password123
        ports:
        - containerPort: 6379
```
**Выполните действия:**

1. Создайте Helm Charts.
2. Добавьте в него сервис.
3. Вынесите все нужные, на ваш взгляд, параметры в `values.yaml`.
4. Запустите чарт в своём кластере и добейтесь его стабильной работы.

В качестве ответа пришлите вывод команды `helm get manifest <имя_релиза>`.

### Ответ:

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/06.%20Kubernetes.%20Часть%202/02.2.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/06.%20Kubernetes.%20Часть%202/02.1.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/06.%20Виртуализация/06.%20Kubernetes.%20Часть%202/02.3.png)

---
