data "kubectl_path_documents" "contour-prep" {
  pattern = "${path.module}/files/01-namespace-role.yaml"
}

resource "kubectl_manifest" "contour-prep" {
  count     = var.skip_contour ? 0 : length(data.kubectl_path_documents.contour-prep.documents)
  yaml_body = element(data.kubectl_path_documents.contour-prep.documents, count.index)
}

data "kubectl_path_documents" "contour-secret" {
  pattern = "${path.module}/files/02-data-values.yaml"
}

resource "kubectl_manifest" "contour-secret" {
  depends_on = [kubectl_manifest.contour-prep]
  count     = var.skip_contour ? 0 : length(data.kubectl_path_documents.contour-secret.documents)
  yaml_body = element(data.kubectl_path_documents.contour-secret.documents, count.index)
}

data "kubectl_path_documents" "contour-app" {
  pattern = "${path.module}/files/03-contour-app.yaml"
}

resource "kubectl_manifest" "contour-app" {
  depends_on = [kubectl_manifest.contour-secret]
  count     = var.skip_contour ? 0 : length(data.kubectl_path_documents.contour-app.documents)
  yaml_body = element(data.kubectl_path_documents.contour-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}
