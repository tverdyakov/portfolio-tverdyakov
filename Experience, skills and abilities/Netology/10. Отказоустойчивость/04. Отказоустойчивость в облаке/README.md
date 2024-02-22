# 10.4 Отказоустойчивость в облаке

## Задание 1 

Возьмите за основу [решение к заданию 1 из занятия «Подъём инфраструктуры в Яндекс Облаке»](https://github.com/netology-code/sdvps-homeworks/blob/main/7-03.md#задание-1).

1. Теперь вместо одной виртуальной машины сделайте terraform playbook, который:

- создаст 2 идентичные виртуальные машины. Используйте аргумент [count](https://www.terraform.io/docs/language/meta-arguments/count.html) для создания таких ресурсов;
- создаст [таргет-группу](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_target_group). Поместите в неё созданные на шаге 1 виртуальные машины;
- создаст [сетевой балансировщик нагрузки](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer), который слушает на порту 80, отправляет трафик на порт 80 виртуальных машин и http healthcheck на порт 80 виртуальных машин.

Рекомендуем изучить [документацию сетевого балансировщика нагрузки](https://cloud.yandex.ru/docs/network-load-balancer/quickstart) для того, чтобы было понятно, что вы сделали.

2. Установите на созданные виртуальные машины пакет Nginx любым удобным способом и запустите Nginx веб-сервер на порту 80.

3. Перейдите в веб-консоль Yandex Cloud и убедитесь, что: 

- созданный балансировщик находится в статусе Active,
- обе виртуальные машины в целевой группе находятся в состоянии healthy.

4. Сделайте запрос на 80 порт на внешний IP-адрес балансировщика и убедитесь, что вы получаете ответ в виде дефолтной страницы Nginx.

*В качестве результата пришлите:*

### *1. Terraform Playbook.*
#### Terraform: [main.tf](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/04.%20Отказоустойчивость%20в%20облаке/screenshots-and-files/main.tf)
```bash
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = XXX
  cloud_id  = XXX
  folder_id = XXX
  zone      = "ru-central1-b"
}

resource "yandex_compute_instance" "vm" {
  count           = 2
  name            = "vm${count.index}"
  platform_id     = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 5
    memory        = 1
  }

  boot_disk {
    initialize_params {
      image_id = "fd8gqjo661d83tv5dnv4"
      size     = 5
    }
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = "${yandex_vpc_network.network-1.id}"
}

resource "yandex_lb_target_group" "tg-1" {
  name        = "tg-1"

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[0].network_interface.0.ip_address
  }
  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[1].network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "lb-1"
  deletion_protection = "false"
  listener {
    name = "listener-lb1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tg-1.id
    healthcheck {
      name = "http"
        http_options {
          port = 80
          path = "/"
      }
    }
  }
}

output "internal_ip_address_vm_0" {
  value = yandex_compute_instance.vm[0].network_interface.0.ip_address
}

output "external_ip_address_vm_0" {
  value = yandex_compute_instance.vm[0].network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm[1].network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm[1].network_interface.0.nat_ip_address
}
```
### *2. Скриншот статуса балансировщика и целевой группы.*
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/04.%20Отказоустойчивость%20в%20облаке/screenshots-and-files/Задание%201.2.png)

### *3. Скриншот страницы, которая открылась при запросе IP-адреса балансировщика.*

![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/04.%20Отказоустойчивость%20в%20облаке/screenshots-and-files/Задание%201.3.0.png)
![png](https://github.com/tverdyakov/portfolio-tverdyakov/blob/main/Experience%2C%20skills%20and%20abilities/Netology/10.%20Отказоустойчивость/04.%20Отказоустойчивость%20в%20облаке/screenshots-and-files/Задание%201.3.1.png)

---
