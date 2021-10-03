<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_workload_cluster_extensions"></a> [workload\_cluster\_extensions](#module\_workload\_cluster\_extensions) | github.com/tanzuformers/tkg_extensions//extensions | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_workload_cluster_context"></a> [workload\_cluster\_context](#input\_workload\_cluster\_context) | The Kubeconfig Context to target. | `string` | `""` | no |
| <a name="input_grafana_admin_password"></a> [grafana\_admin\_password](#input\_grafana\_admin\_password) | The Default Admin Password for grafana. | `string` | `"VMware1!"` | no |
| <a name="input_grafana_ingress_fqdn"></a> [grafana\_ingress\_fqdn](#input\_grafana\_ingress\_fqdn) | The FQDN grafana is accessible at. | `string` | `""` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The DNS Zone for external DNS to manage its records in. | `string` | `""` | no |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | The FQDN or IP of your Microsoft DNS Server that external DNS will manage. | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The Name of the cluster you are targeting. This is used by fluent bit to enrich logs | `string` | `""` | no |
| <a name="input_mgmt_cluster_name"></a> [mgmt\_cluster\_name](#input\_mgmt\_cluster\_name) | The name of the Management Cluster that deployed this workload cluster. This is used by fluent bit to enrich logs. | `string` | `""` | no |
| <a name="input_syslog_host"></a> [syslog\_host](#input\_syslog\_host) | Syslog Host FQDN or IP for Fluent Bit Syslog Output Plugin. | `string` | `""` | no |
| <a name="input_harbor_ingress_fqdn"></a> [harbor\_ingress\_fqdn](#input\_harbor\_ingress\_fqdn) | FQDN to expose Harbor via. | `string` | `""` | no |
| <a name="input_harbor_admin_password"></a> [harbor\_admin\_password](#input\_harbor\_admin\_password) | Default Admin User Password for Harbor. | `string` | `"VMware1!"` | no |
| <a name="input_harbor_registry_pv_size_gb"></a> [harbor\_registry\_pv\_size\_gb](#input\_harbor\_registry\_pv\_size\_gb) | Size of PV for storing images and charts in Harbor. | `number` | `50` | no |
<!-- END_TF_DOCS -->