output "nginx_container_id" {
 value = docker_container.nginx.id
}

output "nginx_container_name" {
 value = docker_container.nginx.name
}

output "nginx_container_ip" {
 value = docker_container.nginx.network_data[0].ip_address
}

