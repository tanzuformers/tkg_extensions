variable "skip_harbor" {
  type = bool
  default = false
}

variable "harbor_ingress_fqdn" {
  type = string
  default = ""
}

variable "harbor_secret_key" {
  type = string
  default = "y5jGWkhvZEDE0hUs"
}

variable "harbor_admin_password" {
  type = string
  default = "VMware1!"
}

variable "harbor_db_password" {
  type = string
  default = "VMware1!"
}

variable "harbor_core_secret" {
  type = string
  default = "g0vGmDnFx963ox78"
}

variable "harbor_xsrf_key" {
  type = string
  default = "BvOPbvh2hwtlsVXcWNi8rAVvIQQ8bn8R"
}

variable "harbor_jobservice_secret" {
  type = string
  default = "PSQUnX4NOuGX5jsX"
}

variable "harbor_registry_secret" {
  type = string
  default = "EOUMERNXjSsGMdZM"
}

variable "harbor_enable_notary" {
  type = bool
  default = true
}

variable "harbor_enable_clair" {
  type = bool
  default = false
}

variable "harbor_enable_trivy" {
  type = bool
  default = true
}

variable "harbor_registry_pv_size_gb" {
  type = number
  default = 50
}
