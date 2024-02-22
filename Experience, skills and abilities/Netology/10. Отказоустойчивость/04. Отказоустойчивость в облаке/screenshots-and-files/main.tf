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
