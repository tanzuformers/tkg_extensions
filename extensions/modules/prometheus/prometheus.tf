data "kubectl_path_documents" "prometheus-prep" {
  pattern = "${path.module}/files/01-namespace-role.yaml"
}

resource "kubectl_manifest" "prometheus-prep" {
  count     = var.skip_prometheus ? 0 : length(data.kubectl_path_documents.prometheus-prep.documents)
  yaml_body = element(data.kubectl_path_documents.prometheus-prep.documents, count.index)
}


data "kubectl_path_documents" "prometheus-secret" {
  pattern = "${path.module}/files/02-prometheus-data-values-secret.yaml"
}

resource "kubectl_manifest" "prometheus-secret" {
  depends_on = [kubectl_manifest.prometheus-prep]
  count     = var.skip_prometheus ? 0 : length(data.kubectl_path_documents.prometheus-secret.documents)
  yaml_body = element(data.kubectl_path_documents.prometheus-secret.documents, count.index)
}


data "kubectl_path_documents" "prometheus-app" {
  pattern = "${path.module}/files/03-prometheus-app.yaml"
}

resource "kubectl_manifest" "prometheus-app" {
  depends_on = [kubectl_manifest.prometheus-secret]
  count     = var.skip_prometheus ? 0 : length(data.kubectl_path_documents.prometheus-app.documents)
  yaml_body = element(data.kubectl_path_documents.prometheus-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}

