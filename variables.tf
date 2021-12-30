variable "cloudamqp_customer_api_key" {
  description = "API key needed to communicate to CloudAMQP's API"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "Name of the CloudAMQP instance"
  type        = string
}

variable "instance_plan" {
  description = "The subscription plan. See available plans https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/guides/info_plan"
  type        = string

  validation {
    condition     = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.instance_plan == "bunny" || var.instance_plan == "rabbit" || var.instance_plan == "panda" || var.instance_plan == "ape" || var.instance_plan == "hippo" || var.instance_plan == "lion" || var.instance_plan == "squirrel-1" || var.instance_plan == "bunny-1" || var.instance_plan == "bunny-3" || var.instance_plan == "rabbit-1" || var.instance_plan == "rabbit-3" || var.instance_plan == "rabbit-5" || var.instance_plan == "panda-1" || var.instance_plan == "panda-3" || var.instance_plan == "panda-5" || var.instance_plan == "ape-1" || var.instance_plan == "ape-3" || var.instance_plan == "ape-5" || var.instance_plan == "hippo-1" || var.instance_plan == "hippo-3" || var.instance_plan == "hippo-5" || var.instance_plan == "lion-1" || var.instance_plan == "lion-3" || var.instance_plan == "lion-5" || var.instance_plan == "rhino-1"
    error_message = "The instance plan must be one of the following: lemur, tiger, bunny, rabbit, panda, ape, hippo or lion. Or on of the new plans: squirrel-1, bunny-1, bunny-3, rabbit-1, rabbit-3, rabbit-5, panda-1, panda-3, panda-5, ape-1, ape-3, ape-5, hippo-1, hippo-3, hippo-5, lion-1, lion-3, lion-5, rhino-1."
  }
}

variable "instance_region" {
  description = "The region to host the instance in. See Instance regions https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/guides/info_region"
  type        = string
}

variable "instance_tags" {
  description = "One or more tags for the CloudAMQP instance, makes it possible to categories multiple instances in console view"
  type        = list(string)
  default     = []
}

variable "instance_rmq_version" {
  description = "The Rabbit MQ version. Note: There is not yet any support in the provider to change the RMQ version. Once it's set in the initial creation, it will remain"
  type        = string
  default     = null
}

variable "instance_vpc_id" {
  description = "The VPC ID. Use this to create your instance in an existing VPC"
  type        = string
  default     = null
}

variable "instance_vpc_subnet" {
  description = "Creates a dedicated VPC subnet, shouldn't overlap with other VPC subnet, default subnet used 10.56.72.0/24. NOTE: extra fee will be charged when using VPC"
  type        = string
  default     = null
}

variable "instance_no_default_alarms" {
  description = "Set to true to discard creating default alarms when the instance is created"
  type        = bool
  default     = true
}

variable "notification_recipients" {
  description = "Recipients to receive alarm notifications"
  type = list(object({
    type  = string
    value = string
    name  = string
  }))
  default = []
}

variable "alarm_cpu_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = true
}

variable "alarm_cpu_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_cpu_value_threshold" {
  description = "The value to trigger the alarm for"
  type        = number
  default     = 90
}

variable "alarm_cpu_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = 600
}

variable "alarm_memory_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = true
}

variable "alarm_memory_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_memory_value_threshold" {
  description = "The value to trigger the alarm for"
  type        = number
  default     = 80
}

variable "alarm_memory_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = 600
}

variable "alarm_disk_space_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = true
}

variable "alarm_disk_space_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_disk_space_value_threshold" {
  description = "The value to trigger the alarm for"
  type        = number
  default     = 5
}

variable "alarm_disk_space_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = 600
}

variable "alarm_queue_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = false
}

variable "alarm_queue_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_queue_value_threshold" {
  description = "The value to trigger the alarm for"
  type        = number
  default     = null
}

variable "alarm_queue_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = null
}

variable "alarm_queue_vhost_regex" {
  description = "Regex for which vhost to check"
  type        = string
  default     = null
}

variable "alarm_queue_regex" {
  description = "Regex for which queue to check"
  type        = string
  default     = null
}

variable "alarm_queue_message_type" {
  description = "Message type (total, unacked, ready) used by queue alarm type."
  type        = string
  default     = null
}

variable "alarm_connection_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = false
}

variable "alarm_connection_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_connection_value_threshold" {
  description = "An alarm will be sent when the number of connections are more than the value threshold for more than number of seconds in the time threshold"
  type        = number
  default     = null
}

variable "alarm_connection_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = null
}

variable "alarm_consumer_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = false
}

variable "alarm_consumer_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_consumer_value_threshold" {
  description = "The value to trigger the alarm for"
  type        = number
  default     = null
}

variable "alarm_consumer_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = null
}

variable "alarm_consumer_vhost_regex" {
  description = "Regex for which vhost to check"
  type        = string
  default     = null
}

variable "alarm_consumer_queue_regex" {
  description = "Regex for which queue to check"
  type        = string
  default     = null
}

variable "alarm_server_unreachable_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = true
}

variable "alarm_server_unreachable_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "alarm_server_unreachable_time_threshold" {
  description = "The time interval (in seconds) the value_threshold should be active before triggering an alarm"
  type        = number
  default     = 150
}

variable "alarm_notice_enable" {
  description = "Enable or disable the alarm to trigger"
  type        = bool
  default     = true
}

variable "alarm_notice_recipients" {
  description = "Identifier for recipient to be notified"
  type        = list(number)
  default     = null
}

variable "custom_domain" {
  description = "Custom domain for the CloudAMQP instance"
  type        = string
  default     = null
}

variable "integration_papertrail_url" {
  description = "Endpoint to log integration"
  type        = string
  default     = null
}

variable "integration_splunk_host_port" {
  description = "Destination to send the logs"
  type        = number
  default     = null
}

variable "integration_splunk_token" {
  description = "Token used for authentication"
  type        = string
  default     = null
}

variable "integration_logentries_token" {
  description = "Token used for authentication"
  type        = string
  default     = null
}

variable "integration_loggly_token" {
  description = "Token used for authentication"
  type        = string
  default     = null
}

variable "integration_aws_region" {
  description = "Region hosting the integration service"
  type        = string
  default     = null
}

variable "integration_aws_access_key_id" {
  description = "AWS access key identifier"
  type        = string
  default     = null
}

variable "integration_aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
  default     = null
}

variable "integration_datadog_region" {
  description = "Region hosting the integration service"
  type        = string
  default     = null
}

variable "integration_datadog_api_key" {
  description = "The integration API key"
  type        = string
  default     = null
}

variable "integration_datadog_tags" {
  description = "Tag the integration, e.g. env=prod, region=europe"
  type        = string
  default     = null
}

variable "integration_stackdriver_project_id" {
  description = "The project identifier"
  type        = string
  default     = null
}

variable "integration_stackdriver_private_key" {
  description = "The private access key"
  type        = string
  default     = null
}

variable "integration_stackdriver_client_email" {
  description = "The client email registered for the integration service"
  type        = string
  default     = null
}

variable "integration_librato_api_key" {
  description = "The integration API key"
  type        = string
  default     = null
}

variable "integration_librato_email" {
  description = "The client email registered for the integration service"
  type        = string
  default     = null
}

variable "integration_newrelic_api_key" {
  description = "The integration API key"
  type        = string
  default     = null
}

variable "integration_newrelic_region" {
  description = "Region hosting the integration service"
  type        = string
  default     = null
}

variable "plugin_activaction" {
  description = "The set of names of the Rabbit MQ plugins"
  type = list(object({
    name    = string
    enabled = bool
  }))
  default = []
}

variable "plugin_community_activaction" {
  description = "The set of names of community the Rabbit MQ plugins"
  type = list(object({
    name    = string
    enabled = bool
  }))
  default = []
}

variable "webhook_vhost" {
  description = "The vhost the queue resides in"
  type        = string
  default     = null
}

variable "webhook_queue" {
  description = "A (durable) queue on your RabbitMQ instance"
  type        = string
  default     = null
}

variable "webhook_uri" {
  description = "A POST request will be made for each message in the queue to this endpoint"
  type        = string
  default     = null
}

variable "webhook_retry_interval" {
  description = "How often we retry if your endpoint fails (in seconds)"
  type        = number
  default     = null
}

variable "webhook_concurrency" {
  description = "Max simultaneous requests to the endpoint"
  type        = number
  default     = null
}

variable "firewall_rules" {
  description = "An array of rules, minimum of 1 needs to be configured"
  type = map(object({
    description = string
    ip          = string
    ports       = list(number)
    services    = list(string)
  }))
  default = {}
}

variable "vpc_peering_aws_vpc_peering_id" {
  description = "Peering identifier created by AWS peering request"
  type        = string
  default     = null
}
