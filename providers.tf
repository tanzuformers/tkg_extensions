provider "kubectl" {
  config_path    = var.kubeconfig_path
  config_context = var.workload_cluster_context
  apply_retry_count = 15
}
