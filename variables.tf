variable "workload_cluster_context" {
  type = string
  default = ""
  description = "The Kubeconfig Context to target."
}

variable "grafana_admin_password" {
  type = string
  default = "VMware1!"
  description = "The Default Admin Password for grafana."
}

variable "grafana_ingress_fqdn" {
  type = string
  default = ""
  description = "The FQDN grafana is accessible at."
}

variable "dns_zone" {
  type = string
  default = ""
  description = "The DNS Zone for external DNS to manage its records in."
}

variable "dns_server" {
  type = string
  default = ""
  description = "The FQDN or IP of your Microsoft DNS Server that external DNS will manage."
}

variable "cluster_name" {
  type = string
  default = ""
  description = "The Name of the cluster you are targeting. This is used by fluent bit to enrich logs"
}

variable "mgmt_cluster_name" {
  type = string
  description = "The name of the Management Cluster that deployed this workload cluster. This is used by fluent bit to enrich logs."
  default = ""
}

variable "syslog_host" {
  type = string
  default = ""
  description = "Syslog Host FQDN or IP for Fluent Bit Syslog Output Plugin."
}

variable "harbor_ingress_fqdn" {
  type = string
  default = ""
  description = "FQDN to expose Harbor via."
}

variable "harbor_admin_password" {
  type = string
  default = "VMware1!"
  description = "Default Admin User Password for Harbor."
}

variable "harbor_registry_pv_size_gb" {
  type = number
  default = 50
  description = "Size of PV for storing images and charts in Harbor."
}
