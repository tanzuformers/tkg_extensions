data "kubectl_path_documents" "fluent-bit-prep" {
  pattern = "${path.module}/files/01-namespace-role.yaml"
}

resource "kubectl_manifest" "fluent-bit-prep" {
  count     = var.skip_fluent_bit ? 0 : length(data.kubectl_path_documents.fluent-bit-prep.documents)
  yaml_body = element(data.kubectl_path_documents.fluent-bit-prep.documents, count.index)
}

locals {
  syslog_yaml = base64encode(templatefile("${path.module}/templates/syslog.tpl", {cluster_name = var.cluster_name, mgmt_cluster_name = var.mgmt_cluster_name, syslog_host = var.syslog_host, syslog_port = var.syslog_port, syslog_mode = var.syslog_mode, syslog_format = var.syslog_format}))
  http_yaml = base64encode(templatefile("${path.module}/templates/http.tpl", {cluster_name = var.cluster_name, mgmt_cluster_name = var.mgmt_cluster_name, http_host = var.http_host, http_port = var.http_port, http_uri = var.http_uri, http_header_key_value = var.http_header_key_value}))
  elasticsearch_yaml = base64encode(templatefile("${path.module}/templates/elasticsearch.tpl", {cluster_name = var.cluster_name, mgmt_cluster_name = var.mgmt_cluster_name, elasticseach_host = var.elasticseach_host, elasticseach_port = var.elasticseach_port}))
  kafka_yaml = base64encode(templatefile("${path.module}/templates/kafka.tpl", {cluster_name = var.cluster_name, mgmt_cluster_name = var.mgmt_cluster_name, kafka_broker_service_name = var.kafka_broker_service_name, kafka_topic_name = var.kafka_topic_name}))
  splunk_yaml = base64encode(templatefile("${path.module}/templates/splunk.tpl", {cluster_name = var.cluster_name, mgmt_cluster_name = var.mgmt_cluster_name, splunk_host = var.splunk_host, splunk_port = var.splunk_port, splunk_token = var.splunk_token}))
}

resource "kubectl_manifest" "syslog-secret" {
  depends_on = [kubectl_manifest.fluent-bit-prep]  
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.syslog_yaml})
  count = var.skip_fluent_bit ? 0 : length(regexall("syslog", var.fluent_bit_output_plugin))
}

resource "kubectl_manifest" "http-secret" {
  depends_on = [kubectl_manifest.fluent-bit-prep]
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.http_yaml})
  count = var.skip_fluent_bit ? 0 : length(regexall("http", var.fluent_bit_output_plugin))
}

resource "kubectl_manifest" "elasticsearch-secret" {
  depends_on = [kubectl_manifest.fluent-bit-prep]
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.elasticsearch_yaml})
  count = var.skip_fluent_bit ? 0 : length(regexall("elasticsearch", var.fluent_bit_output_plugin))
}

resource "kubectl_manifest" "kafka-secret" {
  depends_on = [kubectl_manifest.fluent-bit-prep]
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.kafka_yaml})
  count = var.skip_fluent_bit ? 0 : length(regexall("kafka", var.fluent_bit_output_plugin))
}

resource "kubectl_manifest" "splunk-secret" {
  depends_on = [kubectl_manifest.fluent-bit-prep]
  yaml_body = templatefile("${path.module}/templates/secret.tpl", { b64string = local.splunk_yaml})
  count = var.skip_fluent_bit ? 0 : length(regexall("splunk", var.fluent_bit_output_plugin))
}

data "kubectl_path_documents" "fluent-bit-app" {
  pattern = "${path.module}/files/03-fluent-bit-app.yaml"
}

resource "kubectl_manifest" "fluent-bit-app" {
  depends_on = [kubectl_manifest.fluent-bit-prep]
  count     = var.skip_fluent_bit ? 0 : length(data.kubectl_path_documents.fluent-bit-app.documents)
  yaml_body = element(data.kubectl_path_documents.fluent-bit-app.documents, count.index)
  wait = true
  ignore_fields = ["annotations","resourceVersion","status"]
}
