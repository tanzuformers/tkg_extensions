variable "skip_cert_manager" {
  type = bool
  default = false
  description = "Skip installing cert manager in the cluster."
}

variable "skip_contour" {
  type = bool
  default = false
  description = "Skip installing contour in the cluster."
}

variable "skip_external_dns" {
  type = bool
  default = false
  description = "Skip installing External DNS in the cluster."
}

variable "skip_prometheus" {
  type = bool
  default = false
  description = "Skip installing Prometheus in the cluster."
}

variable "skip_grafana" {
  type = bool
  default = false
  description = "Skip installing Grafana in the cluster."
}

variable "skip_fluent_bit" {
  type = bool
  default = false
  description = "Skip installing Fluent Bit in the cluster."
}

variable "skip_harbor" {
  type = bool
  default = true
  description = "Skip installing Harbor in the cluster."
}

variable "workload_cluster_context" {
  type = string
  default = ""
  description = "The Kubeconfig Context to target."
}

variable "kubeconfig_path" {
  type = string
  default = "~/.kube/config"
  description = "The File path to your kubeconfig."
}

variable "grafana_admin_password" {
  type = string
  default = "VMware1!"
  description = "The Default Admin Password for grafana."
}

variable "grafana_ingress_fqdn" {
  type = string
  default = ""
  description = "The FQDN grafana is accessible at."
}

variable "dns_zone" {
  type = string
  default = ""
  description = "The DNS Zone for external DNS to manage its records in."
}

variable "dns_server" {
  type = string
  default = ""
  description = "The FQDN or IP of your Microsoft DNS Server that external DNS will manage."
}

variable "cluster_name" {
  type = string
  default = ""
  description = "The Name of the cluster you are targeting. This is used by fluent bit to enrich logs"
}

variable "mgmt_cluster_name" {
  type = string
  description = "The name of the Management Cluster that deployed this workload cluster. This is used by fluent bit to enrich logs."
  default = "."
}

variable "fluent_bit_output_plugin" {
  type = string
  default = "syslog"
  validation {
    condition     = contains(["syslog", "elasticsearch", "splunk", "http", "kafka"], var.fluent_bit_output_plugin)
    error_message = "Valid values for fluent_bit_output_plugin are: (syslog, elasticsearch, kafka, splunk and http)."
}
  description = "The backend type to be used for Fluent Bit. Valid options are syslog, elasticsearch, splunk, http, and kafka"
}

variable "elasticseach_host" {
  type = string
  default = ""
  description = "Elastic Search FQDN or IP for Fluent Bit Elastic Search Output Plugin."
}

variable "elasticseach_port" {
  type = string
  default = 9200
  description = "Elastic Search Port for Fluent Bit Elastic Search Output Plugin."
}

variable "http_host" {
  type = string
  default = ""
  description = "HTTP Endpoint FQDN or IP for Fluent Bit HTTP Output Plugin."
}

variable "http_port" {
  type = number
  default = 80
  description = "HTTP Port for Fluent Bit HTTP Output Plugin."
}

variable "http_uri" {
  type = string
  default = ""
  description = "HTTP URI for Fluent Bit HTTP Output Plugin."
}

variable "http_header_key_value" {
  type = string
  default = ""
  description = "HTTP Header for Fluent Bit HTTP Output Plugin."
}

variable "kafka_broker_service_name" {
  type = string
  default = ""
  description = "Kafka Broker Service Name for Fluent Bit Kafka Output Plugin."
}

variable "kafka_topic_name" {
  type = string
  default = ""
  description = "Kafka Topic Name for Fluent Bit Kafka Output Plugin."
}

variable "splunk_host" {
  type = string
  default = ""
  description = "Splunk Host FQDN or IP for Fluent Bit Splunk Output Plugin."
}

variable "splunk_port" {
  type = number
  default = 8088
  description = "Splunk Port for Fluent Bit Splunk Output Plugin."
}

variable "splunk_token" {
  type = string
  default = ""
  description = "Splunk API Token for Fluent Bit Splunk Output Plugin."
}

variable "syslog_host" {
  type = string
  default = ""
  description = "Syslog Host FQDN or IP for Fluent Bit Syslog Output Plugin."
}

variable "syslog_port" {
  type = number
  default = 514
  description = "Syslog Port for Fluent Bit Syslog Output Plugin."
}

variable "syslog_mode" {
  type = string
  default = "udp"
  description = "Syslog Transit Protocol for Fluent Bit Syslog Output Plugin."
}

variable "syslog_format" {
  type = string
  default = "rfc5424"
  description = "Syslog Format to use for Fluent Bit Syslog Output Plugin."
}

variable "harbor_ingress_fqdn" {
  type = string
  default = ""
  description = "FQDN to expose Harbor via."
}

variable "harbor_secret_key" {
  type = string
  default = "y5jGWkhvZEDE0hUs"
  description = "Harbor Secret Key."
}

variable "harbor_admin_password" {
  type = string
  default = "VMware1!"
  description = "Default Admin User Password for Harbor."
}

variable "harbor_db_password" {
  type = string
  default = "VMware1!"
  description = "Default DB Password for Harbor."
}

variable "harbor_core_secret" {
  type = string
  default = "g0vGmDnFx963ox78"
  description = "Harbor Core Secret."
}

variable "harbor_xsrf_key" {
  type = string
  default = "BvOPbvh2hwtlsVXcWNi8rAVvIQQ8bn8R"
  description = "Harbor XSRF Key."
}

variable "harbor_jobservice_secret" {
  type = string
  default = "PSQUnX4NOuGX5jsX"
  description = "Harbor Job Service Secret."
}

variable "harbor_registry_secret" {
  type = string
  default = "EOUMERNXjSsGMdZM"
  description = "Harbor Registry Secret."
}

variable "harbor_enable_notary" {
  type = bool
  default = true
  description = "Enable Notary Server in Harbor."
}

variable "harbor_enable_clair" {
  type = bool
  default = false
  description = "Enable Clair for image scanning in Harbor."
}

variable "harbor_enable_trivy" {
  type = bool
  default = true
  description = "Enable Trivy for image scanning in Harbor."
}

variable "harbor_registry_pv_size_gb" {
  type = number
  default = 50
  description = "Size of PV for storing images and charts in Harbor."
}
