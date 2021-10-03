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
| <a name="input_skip_harbor"></a> [skip\_harbor](#input\_skip\_harbor) | n/a | `bool` | `false` | no |
| <a name="input_harbor_ingress_fqdn"></a> [harbor\_ingress\_fqdn](#input\_harbor\_ingress\_fqdn) | n/a | `string` | `""` | no |
| <a name="input_harbor_secret_key"></a> [harbor\_secret\_key](#input\_harbor\_secret\_key) | n/a | `string` | `"y5jGWkhvZEDE0hUs"` | no |
| <a name="input_harbor_admin_password"></a> [harbor\_admin\_password](#input\_harbor\_admin\_password) | n/a | `string` | `"VMware1!"` | no |
| <a name="input_harbor_db_password"></a> [harbor\_db\_password](#input\_harbor\_db\_password) | n/a | `string` | `"VMware1!"` | no |
| <a name="input_harbor_core_secret"></a> [harbor\_core\_secret](#input\_harbor\_core\_secret) | n/a | `string` | `"g0vGmDnFx963ox78"` | no |
| <a name="input_harbor_xsrf_key"></a> [harbor\_xsrf\_key](#input\_harbor\_xsrf\_key) | n/a | `string` | `"BvOPbvh2hwtlsVXcWNi8rAVvIQQ8bn8R"` | no |
| <a name="input_harbor_jobservice_secret"></a> [harbor\_jobservice\_secret](#input\_harbor\_jobservice\_secret) | n/a | `string` | `"PSQUnX4NOuGX5jsX"` | no |
| <a name="input_harbor_registry_secret"></a> [harbor\_registry\_secret](#input\_harbor\_registry\_secret) | n/a | `string` | `"EOUMERNXjSsGMdZM"` | no |
| <a name="input_harbor_enable_notary"></a> [harbor\_enable\_notary](#input\_harbor\_enable\_notary) | n/a | `bool` | `true` | no |
| <a name="input_harbor_enable_clair"></a> [harbor\_enable\_clair](#input\_harbor\_enable\_clair) | n/a | `bool` | `false` | no |
| <a name="input_harbor_enable_trivy"></a> [harbor\_enable\_trivy](#input\_harbor\_enable\_trivy) | n/a | `bool` | `true` | no |
| <a name="input_harbor_registry_pv_size_gb"></a> [harbor\_registry\_pv\_size\_gb](#input\_harbor\_registry\_pv\_size\_gb) | n/a | `number` | `50` | no |
<!-- END_TF_DOCS -->