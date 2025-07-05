# Terraform Docker Nginx Learn

Mini project belajar Terraform untuk provisioning Docker container (Nginx) secara otomatis.

# Tujuan
- Belajar konsep Provider, Resource, State di Terraform
- Menggunakan Docker sebagai provider lokal
- Menjalankan container Nginx via `terraform apply`


#hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx_terraform"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8082
  }
}

