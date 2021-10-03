<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./modules/cert-manager | n/a |
| <a name="module_contour"></a> [contour](#module\_contour) | ./modules/contour | n/a |
| <a name="module_prometheus"></a> [prometheus](#module\_prometheus) | ./modules/prometheus | n/a |
| <a name="module_grafana"></a> [grafana](#module\_grafana) | ./modules/grafana | n/a |
| <a name="module_external-dns"></a> [external-dns](#module\_external-dns) | ./modules/external-dns | n/a |
| <a name="module_fluent-bit"></a> [fluent-bit](#module\_fluent-bit) | ./modules/fluent-bit | n/a |
| <a name="module_harbor"></a> [harbor](#module\_harbor) | ./modules/harbor | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_skip_cert_manager"></a> [skip\_cert\_manager](#input\_skip\_cert\_manager) | Skip installing cert manager in the cluster. | `bool` | `false` | no |
| <a name="input_skip_contour"></a> [skip\_contour](#input\_skip\_contour) | Skip installing contour in the cluster. | `bool` | `false` | no |
| <a name="input_skip_external_dns"></a> [skip\_external\_dns](#input\_skip\_external\_dns) | Skip installing External DNS in the cluster. | `bool` | `false` | no |
| <a name="input_skip_prometheus"></a> [skip\_prometheus](#input\_skip\_prometheus) | Skip installing Prometheus in the cluster. | `bool` | `false` | no |
| <a name="input_skip_grafana"></a> [skip\_grafana](#input\_skip\_grafana) | Skip installing Grafana in the cluster. | `bool` | `false` | no |
| <a name="input_skip_fluent_bit"></a> [skip\_fluent\_bit](#input\_skip\_fluent\_bit) | Skip installing Fluent Bit in the cluster. | `bool` | `false` | no |
| <a name="input_skip_harbor"></a> [skip\_harbor](#input\_skip\_harbor) | Skip installing Harbor in the cluster. | `bool` | `true` | no |
| <a name="input_workload_cluster_context"></a> [workload\_cluster\_context](#input\_workload\_cluster\_context) | The Kubeconfig Context to target. | `string` | `""` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | The File path to your kubeconfig. | `string` | `"~/.kube/config"` | no |
| <a name="input_grafana_admin_password"></a> [grafana\_admin\_password](#input\_grafana\_admin\_password) | The Default Admin Password for grafana. | `string` | `"VMware1!"` | no |
| <a name="input_grafana_ingress_fqdn"></a> [grafana\_ingress\_fqdn](#input\_grafana\_ingress\_fqdn) | The FQDN grafana is accessible at. | `string` | `""` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The DNS Zone for external DNS to manage its records in. | `string` | `""` | no |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | The FQDN or IP of your Microsoft DNS Server that external DNS will manage. | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The Name of the cluster you are targeting. This is used by fluent bit to enrich logs | `string` | `""` | no |
| <a name="input_mgmt_cluster_name"></a> [mgmt\_cluster\_name](#input\_mgmt\_cluster\_name) | The name of the Management Cluster that deployed this workload cluster. This is used by fluent bit to enrich logs. | `string` | `"."` | no |
| <a name="input_fluent_bit_output_plugin"></a> [fluent\_bit\_output\_plugin](#input\_fluent\_bit\_output\_plugin) | The backend type to be used for Fluent Bit. Valid options are syslog, elasticsearch, splunk, http, and kafka | `string` | `"syslog"` | no |
| <a name="input_elasticseach_host"></a> [elasticseach\_host](#input\_elasticseach\_host) | Elastic Search FQDN or IP for Fluent Bit Elastic Search Output Plugin. | `string` | `""` | no |
| <a name="input_elasticseach_port"></a> [elasticseach\_port](#input\_elasticseach\_port) | Elastic Search Port for Fluent Bit Elastic Search Output Plugin. | `string` | `9200` | no |
| <a name="input_http_host"></a> [http\_host](#input\_http\_host) | HTTP Endpoint FQDN or IP for Fluent Bit HTTP Output Plugin. | `string` | `""` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | HTTP Port for Fluent Bit HTTP Output Plugin. | `number` | `80` | no |
| <a name="input_http_uri"></a> [http\_uri](#input\_http\_uri) | HTTP URI for Fluent Bit HTTP Output Plugin. | `string` | `""` | no |
| <a name="input_http_header_key_value"></a> [http\_header\_key\_value](#input\_http\_header\_key\_value) | HTTP Header for Fluent Bit HTTP Output Plugin. | `string` | `""` | no |
| <a name="input_kafka_broker_service_name"></a> [kafka\_broker\_service\_name](#input\_kafka\_broker\_service\_name) | Kafka Broker Service Name for Fluent Bit Kafka Output Plugin. | `string` | `""` | no |
| <a name="input_kafka_topic_name"></a> [kafka\_topic\_name](#input\_kafka\_topic\_name) | Kafka Topic Name for Fluent Bit Kafka Output Plugin. | `string` | `""` | no |
| <a name="input_splunk_host"></a> [splunk\_host](#input\_splunk\_host) | Splunk Host FQDN or IP for Fluent Bit Splunk Output Plugin. | `string` | `""` | no |
| <a name="input_splunk_port"></a> [splunk\_port](#input\_splunk\_port) | Splunk Port for Fluent Bit Splunk Output Plugin. | `number` | `8088` | no |
| <a name="input_splunk_token"></a> [splunk\_token](#input\_splunk\_token) | Splunk API Token for Fluent Bit Splunk Output Plugin. | `string` | `""` | no |
| <a name="input_syslog_host"></a> [syslog\_host](#input\_syslog\_host) | Syslog Host FQDN or IP for Fluent Bit Syslog Output Plugin. | `string` | `""` | no |
| <a name="input_syslog_port"></a> [syslog\_port](#input\_syslog\_port) | Syslog Port for Fluent Bit Syslog Output Plugin. | `number` | `514` | no |
| <a name="input_syslog_mode"></a> [syslog\_mode](#input\_syslog\_mode) | Syslog Transit Protocol for Fluent Bit Syslog Output Plugin. | `string` | `"udp"` | no |
| <a name="input_syslog_format"></a> [syslog\_format](#input\_syslog\_format) | Syslog Format to use for Fluent Bit Syslog Output Plugin. | `string` | `"rfc5424"` | no |
| <a name="input_harbor_ingress_fqdn"></a> [harbor\_ingress\_fqdn](#input\_harbor\_ingress\_fqdn) | FQDN to expose Harbor via. | `string` | `""` | no |
| <a name="input_harbor_secret_key"></a> [harbor\_secret\_key](#input\_harbor\_secret\_key) | Harbor Secret Key. | `string` | `"y5jGWkhvZEDE0hUs"` | no |
| <a name="input_harbor_admin_password"></a> [harbor\_admin\_password](#input\_harbor\_admin\_password) | Default Admin User Password for Harbor. | `string` | `"VMware1!"` | no |
| <a name="input_harbor_db_password"></a> [harbor\_db\_password](#input\_harbor\_db\_password) | Default DB Password for Harbor. | `string` | `"VMware1!"` | no |
| <a name="input_harbor_core_secret"></a> [harbor\_core\_secret](#input\_harbor\_core\_secret) | Harbor Core Secret. | `string` | `"g0vGmDnFx963ox78"` | no |
| <a name="input_harbor_xsrf_key"></a> [harbor\_xsrf\_key](#input\_harbor\_xsrf\_key) | Harbor XSRF Key. | `string` | `"BvOPbvh2hwtlsVXcWNi8rAVvIQQ8bn8R"` | no |
| <a name="input_harbor_jobservice_secret"></a> [harbor\_jobservice\_secret](#input\_harbor\_jobservice\_secret) | Harbor Job Service Secret. | `string` | `"PSQUnX4NOuGX5jsX"` | no |
| <a name="input_harbor_registry_secret"></a> [harbor\_registry\_secret](#input\_harbor\_registry\_secret) | Harbor Registry Secret. | `string` | `"EOUMERNXjSsGMdZM"` | no |
| <a name="input_harbor_enable_notary"></a> [harbor\_enable\_notary](#input\_harbor\_enable\_notary) | Enable Notary Server in Harbor. | `bool` | `true` | no |
| <a name="input_harbor_enable_clair"></a> [harbor\_enable\_clair](#input\_harbor\_enable\_clair) | Enable Clair for image scanning in Harbor. | `bool` | `false` | no |
| <a name="input_harbor_enable_trivy"></a> [harbor\_enable\_trivy](#input\_harbor\_enable\_trivy) | Enable Trivy for image scanning in Harbor. | `bool` | `true` | no |
| <a name="input_harbor_registry_pv_size_gb"></a> [harbor\_registry\_pv\_size\_gb](#input\_harbor\_registry\_pv\_size\_gb) | Size of PV for storing images and charts in Harbor. | `number` | `50` | no |
<!-- END_TF_DOCS -->