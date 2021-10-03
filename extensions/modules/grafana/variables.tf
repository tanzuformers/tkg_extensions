variable "skip_grafana" {
  type = bool
  default = false
}

variable "grafana_admin_password" {
  type = string
  default = "VMware1!"
}

variable "grafana_ingress_fqdn" {
  type = string
  default = "grafana.tf.terasky.demo"
}
