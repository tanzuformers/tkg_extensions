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
| <a name="input_skip_external_dns"></a> [skip\_external\_dns](#input\_skip\_external\_dns) | n/a | `bool` | `false` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | n/a | `string` | `"terasky.demo"` | no |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | n/a | `string` | `"10.100.100.100"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"demo-tkg-cls-08"` | no |
<!-- END_TF_DOCS -->