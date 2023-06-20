module "auto_cidr" {
  source             = "github.com/massdriver-cloud/terraform-modules//azure/auto-cidr?ref=e9fbd67"
  network_mask       = var.network_mask
  virtual_network_id = var.virtual_network_id
}
