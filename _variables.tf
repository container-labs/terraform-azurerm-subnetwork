variable "name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "tags" {
  type = any
}

variable "region" {
  type = string
}

variable "virtual_network_id" {
  type = string
}

variable "network_mask" {
  type    = string
  default = 20
}
