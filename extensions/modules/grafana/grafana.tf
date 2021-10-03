data "kubectl_path_documents" "grafana-prep" {
  pattern = "${path.module}/files/01-roles.yaml"
}

resource "kubectl_manifest" "grafana-prep" {
  count     = var.skip_grafana ? 0 : length(data.kubectl_path_documents.grafana-prep.documents)
  yaml_body = element(data.kubectl_path_documents.grafana-prep.documents, count.index)
}

locals {
  grafana_data_values_yaml = base64encode(templatefile("${path.module}/templates/grafana-data-values.tpl", {grafana_admin_password = base64encode(var.grafana_admin_password), grafana_ingress_fqdn = var. grafana_ingress_fqdn}))
}
resource "kubectl_manifest" "grafana-data-values" {
  depends_on = [kubectl_manifest.grafana-prep]
  count = var.skip_grafana ? 0 : 1
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.grafana_data_values_yaml})
}

data "kubectl_path_documents" "grafana-app" {
  pattern = "${path.module}/files/03-grafana-app.yaml"
}

resource "kubectl_manifest" "grafana-app" {
  depends_on = [kubectl_manifest.grafana-data-values]
  count     = var.skip_grafana ? 0 : length(data.kubectl_path_documents.grafana-app.documents)
  yaml_body = element(data.kubectl_path_documents.grafana-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}
