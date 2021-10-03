variable "skip_cert_manager" {
  type = bool
  default = false
}
variable "workload_cluster_context" {
  type = string
  default = ""
}

variable "kubeconfig_path" {
  type = string
  default = "~/.kube/config"
}
