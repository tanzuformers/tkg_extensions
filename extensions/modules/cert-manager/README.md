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
| <a name="input_skip_cert_manager"></a> [skip\_cert\_manager](#input\_skip\_cert\_manager) | n/a | `bool` | `false` | no |
| <a name="input_workload_cluster_context"></a> [workload\_cluster\_context](#input\_workload\_cluster\_context) | n/a | `string` | `""` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | n/a | `string` | `"~/.kube/config"` | no |
<!-- END_TF_DOCS -->