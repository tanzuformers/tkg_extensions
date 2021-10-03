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
| <a name="input_skip_grafana"></a> [skip\_grafana](#input\_skip\_grafana) | n/a | `bool` | `false` | no |
| <a name="input_grafana_admin_password"></a> [grafana\_admin\_password](#input\_grafana\_admin\_password) | n/a | `string` | `"VMware1!"` | no |
| <a name="input_grafana_ingress_fqdn"></a> [grafana\_ingress\_fqdn](#input\_grafana\_ingress\_fqdn) | n/a | `string` | `"grafana.tf.terasky.demo"` | no |
<!-- END_TF_DOCS -->