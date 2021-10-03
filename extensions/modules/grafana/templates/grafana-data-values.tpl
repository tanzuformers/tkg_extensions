#@data/values
#@overlay/match-child-defaults missing_ok=True
---
monitoring:
  grafana:
    image:
      repository: "projects.registry.vmware.com/tkg/grafana"
    secret:
      admin_password: "${grafana_admin_password}"
    ingress:
      virtual_host_fqdn: "${grafana_ingress_fqdn}"
  grafana_init_container:
    image:
      repository: "projects.registry.vmware.com/tkg/grafana"
  grafana_sc_dashboard:
    image:
      repository: "projects.registry.vmware.com/tkg/grafana"
