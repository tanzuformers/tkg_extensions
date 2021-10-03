apiVersion: v1
data:
  values.yaml: ${b64string}
kind: Secret
metadata:
  name: fluent-bit-data-values
  namespace: tanzu-system-logging
