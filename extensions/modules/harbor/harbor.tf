data "kubectl_path_documents" "harbor-prep" {
  pattern = "${path.module}/files/01-namespace-role.yaml"
}

resource "kubectl_manifest" "harbor-prep" {
  count     = var.skip_harbor ? 0 : length(data.kubectl_path_documents.harbor-prep.documents)
  yaml_body = element(data.kubectl_path_documents.harbor-prep.documents, count.index)
}

locals {
  enable_trivy = var.harbor_enable_trivy ? "true" : "false"
  enable_clair = var.harbor_enable_clair ? "true" : "false"
  enable_notary = var.harbor_enable_notary ? "true" : "false"
  harbor_data_values_yaml = base64encode(templatefile("${path.module}/templates/harbor-data-values.tpl", {harbor_ingress_fqdn = var.harbor_ingress_fqdn, harbor_admin_password = var.harbor_admin_password, harbor_db_password = var.harbor_db_password, harbor_secret_key = var.harbor_secret_key, harbor_core_secret = var.harbor_core_secret, harbor_xsrf_key = var.harbor_xsrf_key, harbor_jobservice_secret = var.harbor_jobservice_secret, harbor_registry_secret = var.harbor_registry_secret, harbor_enable_notary = local.enable_notary, harbor_enable_clair = local.enable_clair, harbor_enable_trivy = local.enable_trivy, harbor_registry_pv_size_gb = var.harbor_registry_pv_size_gb}))
}
resource "kubectl_manifest" "harbor-data-values" {
  depends_on = [kubectl_manifest.harbor-prep]
  count = var.skip_harbor ? 0 : 1
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.harbor_data_values_yaml})
}

data "kubectl_path_documents" "harbor-app" {
  pattern = "${path.module}/files/03-harbor-app.yaml"
}

resource "kubectl_manifest" "harbor-app" {
  depends_on = [kubectl_manifest.harbor-data-values]
  count     = var.skip_harbor ? 0 : length(data.kubectl_path_documents.harbor-app.documents)
  yaml_body = element(data.kubectl_path_documents.harbor-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}
