variable "skip_fluent_bit" {
  type = bool
  default = false
}

variable "cluster_name" {
  type = string
  default = "demo-tkg-cls-08"
}

variable "mgmt_cluster_name" {
  type = string
  default = "demo-tkg-mgmt-cls"
}

variable "fluent_bit_output_plugin" {
  type = string
  default = "syslog"
  validation {
    condition     = contains(["syslog", "elasticsearch", "splunk", "http", "kafka"], var.fluent_bit_output_plugin)
    error_message = "Valid values for fluent_bit_output_plugin are: (syslog, elasticsearch, kafka, splunk and http)."
  }
}
variable "elasticseach_host" {
  type = string
  default = ""
}
variable "elasticseach_port" {
  type = string
  default = 9200
}
variable "http_host" {
  type = string
  default = ""
}
variable "http_port" {
  type = number
  default = 80
}
variable "http_uri" {
  type = string
  default = ""
}
variable "http_header_key_value" {
  type = string
  default = ""
}
variable "kafka_broker_service_name" {
  type = string
  default = ""
}
variable "kafka_topic_name" {
  type = string
  default = ""
}
variable "splunk_host" {
  type = string
  default = ""
}
variable "splunk_port" {
  type = number
  default = 8088
}
variable "splunk_token" {
  type = string
  default = ""
}
variable "syslog_host" {
  type = string
  default = "vrli.terasky.demo"
}
variable "syslog_port" {
  type = number
  default = 514
}
variable "syslog_mode" {
  type = string
  default = "udp"
}
variable "syslog_format" {
  type = string
  default = "rfc5424"
}
