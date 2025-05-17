output "public_ip" {
  value = module.network.public_ip_address
}
output "todo_app_endpoint" {
  value = "http://${module.network.public_ip_address}:8080"
}