output "id" {
  value = azurerm_subnet.main.id
}

output "cidr" {
  value = local.cidr
}
