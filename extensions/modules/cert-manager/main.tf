
data "kubectl_path_documents" "cert-manager-prep" {
  pattern = "${path.module}/files/01-namespace-roles.yaml"
}

resource "kubectl_manifest" "cert-manager-prep" {
  count     = var.skip_cert_manager ? 0 : length(data.kubectl_path_documents.cert-manager-prep.documents)
  yaml_body = element(data.kubectl_path_documents.cert-manager-prep.documents, count.index)
}


data "kubectl_path_documents" "cert-manager-crds" {
  pattern = "${path.module}/files/02-crds.yaml"
}

resource "kubectl_manifest" "cert-manager-crds" {
  depends_on = [kubectl_manifest.cert-manager-prep]
  count     = var.skip_cert_manager ? 0 : length(data.kubectl_path_documents.cert-manager-crds.documents)
  yaml_body = element(data.kubectl_path_documents.cert-manager-crds.documents, count.index)
}

data "kubectl_path_documents" "cert-manager-app" {
  pattern = "${path.module}/files/03-cert-manager.yaml"
}

resource "kubectl_manifest" "cert-manager-app" {
  depends_on = [kubectl_manifest.cert-manager-crds]
  count     = var.skip_cert_manager ? 0 : length(data.kubectl_path_documents.cert-manager-app.documents)
  yaml_body = element(data.kubectl_path_documents.cert-manager-app.documents, count.index)
}
