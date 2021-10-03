<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.8.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_skip_fluent_bit"></a> [skip\_fluent\_bit](#input\_skip\_fluent\_bit) | n/a | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"demo-tkg-cls-08"` | no |
| <a name="input_mgmt_cluster_name"></a> [mgmt\_cluster\_name](#input\_mgmt\_cluster\_name) | n/a | `string` | `"demo-tkg-mgmt-cls"` | no |
| <a name="input_fluent_bit_output_plugin"></a> [fluent\_bit\_output\_plugin](#input\_fluent\_bit\_output\_plugin) | n/a | `string` | `"syslog"` | no |
| <a name="input_elasticseach_host"></a> [elasticseach\_host](#input\_elasticseach\_host) | n/a | `string` | `""` | no |
| <a name="input_elasticseach_port"></a> [elasticseach\_port](#input\_elasticseach\_port) | n/a | `string` | `9200` | no |
| <a name="input_http_host"></a> [http\_host](#input\_http\_host) | n/a | `string` | `""` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | n/a | `number` | `80` | no |
| <a name="input_http_uri"></a> [http\_uri](#input\_http\_uri) | n/a | `string` | `""` | no |
| <a name="input_http_header_key_value"></a> [http\_header\_key\_value](#input\_http\_header\_key\_value) | n/a | `string` | `""` | no |
| <a name="input_kafka_broker_service_name"></a> [kafka\_broker\_service\_name](#input\_kafka\_broker\_service\_name) | n/a | `string` | `""` | no |
| <a name="input_kafka_topic_name"></a> [kafka\_topic\_name](#input\_kafka\_topic\_name) | n/a | `string` | `""` | no |
| <a name="input_splunk_host"></a> [splunk\_host](#input\_splunk\_host) | n/a | `string` | `""` | no |
| <a name="input_splunk_port"></a> [splunk\_port](#input\_splunk\_port) | n/a | `number` | `8088` | no |
| <a name="input_splunk_token"></a> [splunk\_token](#input\_splunk\_token) | n/a | `string` | `""` | no |
| <a name="input_syslog_host"></a> [syslog\_host](#input\_syslog\_host) | n/a | `string` | `"vrli.terasky.demo"` | no |
| <a name="input_syslog_port"></a> [syslog\_port](#input\_syslog\_port) | n/a | `number` | `514` | no |
| <a name="input_syslog_mode"></a> [syslog\_mode](#input\_syslog\_mode) | n/a | `string` | `"udp"` | no |
| <a name="input_syslog_format"></a> [syslog\_format](#input\_syslog\_format) | n/a | `string` | `"rfc5424"` | no |
<!-- END_TF_DOCS -->