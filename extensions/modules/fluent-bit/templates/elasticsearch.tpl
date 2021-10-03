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
  output_plugin: "elasticsearch"
  elasticsearch:
    host: "${elasticseach_host}"
    port: "${elasticseach_port}"
