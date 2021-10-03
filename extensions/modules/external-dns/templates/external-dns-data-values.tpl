#@data/values
#@overlay/match-child-defaults missing_ok=True
---
externalDns:
  image:
    repository: projects.registry.vmware.com/tkg
  deployment:
    #@overlay/replace
    args:
    - --txt-owner-id=${cluster_name}
    - --provider=rfc2136
    - --rfc2136-host=${dns_server} #! IP of RFC2136 compatible dns server
    - --rfc2136-port=53
    - --rfc2136-zone=${dns_zone} #! zone where services are deployed
    - --rfc2136-insecure
    - --rfc2136-tsig-axfr
    - --source=service
    - --source=contour-httpproxy #! export contour HTTPProxy objs
    - --source=ingress
    - --domain-filter=${dns_zone} #! zone where services are deployed
