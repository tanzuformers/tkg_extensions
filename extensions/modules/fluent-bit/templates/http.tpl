#@data/values
#@overlay/match-child-defaults missing_ok=True
---
logging:
  image:
    repository: projects.registry.vmware.com/tkg
tkg:
  instance_name: "${mgmt_cluster_name}"
  cluster_name: "${cluster_name}"
fluent_bit:
  output_plugin: "http"
  http:
    host: "${http_host}"
    port: "${http_port}"
    uri: "${http_uri}"
    header_key_value: "${http_header_key_value}"
    format: "json"
