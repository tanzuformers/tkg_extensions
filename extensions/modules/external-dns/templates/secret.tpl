apiVersion: v1
data:
  values.yaml: ${b64string}
kind: Secret
metadata:
  name: external-dns-data-values
  namespace: tanzu-system-service-discovery
