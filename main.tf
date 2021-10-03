module "workload_cluster_extensions" {
  source = "github.com/tanzuformers/tkg_extensions//extensions"
  workload_cluster_context = var.workload_cluster_context
  grafana_admin_password = var.grafana_admin_password
  grafana_ingress_fqdn = var.grafana_ingress_fqdn
  dns_zone = var.dns_zone
  dns_server = var.dns_server
  cluster_name = var.cluster_name
  mgmt_cluster_name = var.mgmt_cluster_name
  fluent_bit_output_plugin = "syslog"
  syslog_host = var.syslog_host
  harbor_ingress_fqdn = var.harbor_ingress_fqdn
  harbor_admin_password = var.harbor_admin_password
  harbor_registry_pv_size_gb = var.harbor_registry_pv_size_gb
}
