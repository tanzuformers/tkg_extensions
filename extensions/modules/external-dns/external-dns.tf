data "kubectl_path_documents" "external-dns-prep" {
  pattern = "${path.module}/files/01-namespace-role.yaml"
}

resource "kubectl_manifest" "external-dns-prep" {
  count     = var.skip_external_dns ? 0 : length(data.kubectl_path_documents.external-dns-prep.documents)
  yaml_body = element(data.kubectl_path_documents.external-dns-prep.documents, count.index)
}

locals {
  external_dns_data_values_yaml = base64encode(templatefile("${path.module}/templates/external-dns-data-values.tpl", {dns_server = var.dns_server, dns_zone = var.dns_zone, cluster_name = var.cluster_name}))
}
resource "kubectl_manifest" "external-dns-data-values" {
  depends_on = [kubectl_manifest.external-dns-prep]  
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.external_dns_data_values_yaml})
  count = var.skip_external_dns ? 0 : 1
}

data "kubectl_path_documents" "external-dns-app" {
  pattern = "${path.module}/files/03-external-dns-app.yaml"
}

resource "kubectl_manifest" "external-dns-app" {
  depends_on = [kubectl_manifest.external-dns-data-values]
  count     = var.skip_external_dns ? 0 : length(data.kubectl_path_documents.external-dns-app.documents)
  yaml_body = element(data.kubectl_path_documents.external-dns-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}
