apiVersion: v1
data:
  values.yaml: ${b64string}
kind: Secret
metadata:
  name: harbor-data-values
  namespace: tanzu-system-registry
