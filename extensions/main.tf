module "cert-manager" {
  source = "github.com/tanzuformers/tkg_extensions//extensions/modules/cert-manager"
  count  = var.skip_cert_manager ? 0 : 1
}

module "contour" {
  source = "github.com/tanzuformers/tkg_extensions//extensions/modules/contour"
  count  = var.skip_contour ? 0 : 1
}

module "prometheus" {
  source = "github.com/tanzuformers/tkg_extensions//extensions/modules/prometheus"
  count  = var.skip_prometheus ? 0 : 1
}

module "grafana" {
  source                 = "github.com/tanzuformers/tkg_extensions//extensions/modules/grafana"
  count                  = var.skip_grafana ? 0 : 1
  grafana_ingress_fqdn   = var.grafana_ingress_fqdn
  grafana_admin_password = var.grafana_admin_password
}

module "external-dns" {
  source       = "github.com/tanzuformers/tkg_extensions//extensions/modules/external-dns"
  count        = var.skip_external_dns ? 0 : 1
  dns_server   = var.dns_server
  dns_zone     = var.dns_zone
  cluster_name = var.cluster_name
}

module "fluent-bit" {
  source = "github.com/tanzuformers/tkg_extensions//extensions/modules/fluent-bit"
  count = var.skip_fluent_bit ? 0 : 1
  fluent_bit_output_plugin = var.fluent_bit_output_plugin
  syslog_host   = var.syslog_host
  syslog_port   = var.syslog_port
  syslog_mode   = var.syslog_mode
  syslog_format = var.syslog_format
}

module "harbor" {
  source = "github.com/tanzuformers/tkg_extensions//extensions/modules/harbor"
  count = var.skip_harbor ? 0 : 1
  harbor_ingress_fqdn = var.harbor_ingress_fqdn
  harbor_admin_password = var.harbor_admin_password
  harbor_db_password = var.harbor_db_password
  harbor_registry_pv_size_gb = var.harbor_registry_pv_size_gb
}
