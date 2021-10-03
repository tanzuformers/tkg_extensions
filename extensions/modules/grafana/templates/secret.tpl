apiVersion: v1
data:
  values.yaml: ${b64string}
kind: Secret
metadata:
  name: grafana-data-values
  namespace: tanzu-system-monitoring
