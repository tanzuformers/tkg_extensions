variable "skip_external_dns" {
  type = bool
  default = false
}

variable "dns_zone" {
  type = string
  default = "terasky.demo"
}

variable "dns_server" {
  type = string
  default = "10.100.100.100"
}

variable "cluster_name" {
  type = string
  default = "demo-tkg-cls-08"
}

