terraform {
  required_providers {
    cloudamqp = {
      source  = "cloudamqp/cloudamqp"
      version = "~>1.14.0"
    }
  }
  required_version = ">= 0.13.0"
}

# Configure the CloudAMQP Provider
provider "cloudamqp" {
  apikey = var.cloudamqp_customer_api_key
}

# Create a new cloudamqp instance
resource "cloudamqp_instance" "instance" {
  name              = var.instance_name
  plan              = var.instance_plan
  region            = var.instance_region
  tags              = var.instance_tags
  no_default_alarms = var.instance_no_default_alarms
  rmq_version       = var.instance_rmq_version
  vpc_id            = var.instance_vpc_id
  vpc_subnet        = var.instance_vpc_subnet
}

# New recipient to receieve notifications
resource "cloudamqp_notification" "recipient" {
  count       = length(var.notification_recipients)
  instance_id = cloudamqp_instance.instance.id
  type        = var.notification_recipients[count.index].type
  value       = var.notification_recipients[count.index].value
  name        = var.notification_recipients[count.index].name
}

# New cpu alarm
resource "cloudamqp_alarm" "cpu_alarm" {
  count           = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.alarm_cpu_time_threshold == null ? 0 : 1
  enabled         = var.alarm_cpu_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "cpu"
  value_threshold = var.alarm_cpu_value_threshold
  time_threshold  = var.alarm_cpu_time_threshold
  recipients      = var.alarm_cpu_recipients != null ? var.alarm_cpu_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New memory alarm
resource "cloudamqp_alarm" "memory_alarm" {
  count           = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.alarm_memory_time_threshold == null ? 0 : 1
  enabled         = var.alarm_memory_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "memory"
  value_threshold = var.alarm_memory_value_threshold
  time_threshold  = var.alarm_memory_time_threshold
  recipients      = var.alarm_memory_recipients != null ? var.alarm_memory_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New disk space alarm
resource "cloudamqp_alarm" "disk_space_alarm" {
  count           = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.alarm_disk_space_time_threshold == null ? 0 : 1
  enabled         = var.alarm_disk_space_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "disk"
  value_threshold = var.alarm_disk_space_value_threshold
  time_threshold  = var.alarm_disk_space_time_threshold
  recipients      = var.alarm_disk_space_recipients != null ? var.alarm_disk_space_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New queue alarm
resource "cloudamqp_alarm" "queue_alarm" {
  count           = var.alarm_queue_time_threshold == null ? 0 : 1
  enabled         = var.alarm_queue_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "disk"
  value_threshold = var.alarm_queue_value_threshold
  time_threshold  = var.alarm_queue_time_threshold
  vhost_regex     = var.alarm_queue_vhost_regex
  queue_regex     = var.alarm_queue_regex
  message_type    = var.alarm_queue_message_type
  recipients      = var.alarm_queue_recipients != null ? var.alarm_queue_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New connection alarm
resource "cloudamqp_alarm" "connection_alarm" {
  count           = var.alarm_connection_time_threshold == null ? 0 : 1
  enabled         = var.alarm_connection_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "connection"
  value_threshold = var.alarm_connection_value_threshold
  time_threshold  = var.alarm_connection_time_threshold
  recipients      = var.alarm_connection_recipients != null ? var.alarm_connection_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New consumer alarm
resource "cloudamqp_alarm" "consumer_alarm" {
  count           = var.alarm_consumer_time_threshold == null ? 0 : 1
  enabled         = var.alarm_consumer_enable
  instance_id     = cloudamqp_instance.instance.id
  type            = "consumer"
  value_threshold = var.alarm_consumer_value_threshold
  time_threshold  = var.alarm_consumer_time_threshold
  vhost_regex     = var.alarm_consumer_vhost_regex
  queue_regex     = var.alarm_consumer_queue_regex
  recipients      = var.alarm_consumer_recipients != null ? var.alarm_consumer_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New server unreachable alarm
resource "cloudamqp_alarm" "server_unreachable_alarm" {
  count          = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.alarm_server_unreachable_time_threshold == null ? 0 : 1
  enabled        = var.alarm_server_unreachable_enable
  instance_id    = cloudamqp_instance.instance.id
  type           = "server_unreachable"
  time_threshold = var.alarm_server_unreachable_time_threshold
  recipients     = var.alarm_server_unreachable_recipients != null ? var.alarm_server_unreachable_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New notice alarm
resource "cloudamqp_alarm" "notice_alarm" {
  enabled     = var.alarm_notice_enable
  instance_id = cloudamqp_instance.instance.id
  type        = "notice"
  recipients  = var.alarm_notice_recipients != null ? var.alarm_notice_recipients : (length(var.notification_recipients) > 0 ? cloudamqp_notification.recipient[*].id : [])
}

# New custom domain
resource "cloudamqp_custom_domain" "custom_domain" {
  count       = var.instance_plan == "lemur" || var.instance_plan == "tiger" || var.custom_domain == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  hostname    = var.custom_domain
}

# New cloudwatch log integration
resource "cloudamqp_integration_log" "cloudwatch" {
  count             = var.integration_aws_access_key_id == null ? 0 : 1
  instance_id       = cloudamqp_instance.instance.id
  name              = "cloudwatchlog"
  access_key_id     = var.integration_aws_access_key_id
  secret_access_key = var.integration_aws_secret_access_key
  region            = var.integration_aws_region
}

# New logentries log integration
resource "cloudamqp_integration_log" "logentries" {
  count       = var.integration_logentries_token == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "logentries"
  token       = var.integration_logentries_token
}

# New loggly log integration
resource "cloudamqp_integration_log" "loggly" {
  count       = var.integration_loggly_token == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "loggly"
  token       = var.integration_loggly_token
}

# New papertrail log integration
resource "cloudamqp_integration_log" "papertrail" {
  count       = var.integration_papertrail_url == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "papertrail"
  url         = var.integration_papertrail_url
}

# New splunk log integration
resource "cloudamqp_integration_log" "splunk" {
  count       = var.integration_splunk_token == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "splunk"
  token       = var.integration_splunk_token
  host_port   = var.integration_splunk_host_port
}

# New datadog log integration
resource "cloudamqp_integration_log" "datadog" {
  count       = var.integration_datadog_api_key == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "datadog"
  region      = var.integration_datadog_region
  api_key     = var.integration_datadog_api_key
  tags        = var.integration_datadog_tags
}

# New stackdriver log integration
resource "cloudamqp_integration_log" "stackdriver" {
  count        = var.integration_stackdriver_private_key == null ? 0 : 1
  instance_id  = cloudamqp_instance.instance.id
  name         = "stackdriver"
  project_id   = var.integration_stackdriver_project_id
  private_key  = var.integration_stackdriver_private_key
  client_email = var.integration_stackdriver_client_email
}

# New cloudwatch metric integration
resource "cloudamqp_integration_metric" "cloudwatch" {
  count             = var.integration_aws_access_key_id == null ? 0 : 1
  instance_id       = cloudamqp_instance.instance.id
  name              = "cloudwatch"
  access_key_id     = var.integration_aws_access_key_id
  secret_access_key = var.integration_aws_secret_access_key
  region            = var.integration_aws_region
}

# New datadog metric integration
resource "cloudamqp_integration_metric" "datadog" {
  count       = var.integration_datadog_api_key == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "datadog"
  api_key     = var.integration_datadog_api_key
  region      = var.integration_datadog_region
}

# New librato metric integration
resource "cloudamqp_integration_metric" "librato" {
  count       = var.integration_librato_api_key == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "librato"
  email       = var.integration_librato_email
  api_key     = var.integration_librato_api_key
}

# New newrerlic metric integration
resource "cloudamqp_integration_metric" "newrelic" {
  count       = var.integration_newrelic_api_key == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  name        = "newrelic_v2"
  api_key     = var.integration_newrelic_api_key
  region      = var.integration_newrelic_region
}

# New stackdriver metric integration
resource "cloudamqp_integration_metric" "stackdriver" {
  count        = var.integration_stackdriver_private_key == null ? 0 : 1
  instance_id  = cloudamqp_instance.instance.id
  name         = "stackdriver"
  project_id   = var.integration_stackdriver_project_id
  private_key  = var.integration_stackdriver_private_key
  client_email = var.integration_stackdriver_client_email
}

# New plugin activation
resource "cloudamqp_plugin" "plugin" {
  count       = length(var.plugin_activaction)
  instance_id = cloudamqp_instance.instance.id
  name        = var.plugin_activaction[count.index].name
  enabled     = var.plugin_activaction[count.index].enabled
}

# New community plugin activation
resource "cloudamqp_plugin_community" "plugin" {
  count       = length(var.plugin_community_activaction)
  instance_id = cloudamqp_instance.instance.id
  name        = var.plugin_community_activaction[count.index].name
  enabled     = var.plugin_community_activaction[count.index].enabled
}

# New webhook
resource "cloudamqp_webhook" "webhook" {
  count          = var.webhook_vhost == null ? 0 : 1
  instance_id    = cloudamqp_instance.instance.id
  vhost          = var.webhook_vhost
  queue          = var.webhook_queue
  webhook_uri    = var.webhook_uri
  retry_interval = var.webhook_retry_interval
  concurrency    = var.webhook_concurrency
}

# New firewall settings
resource "cloudamqp_security_firewall" "firewall_settings" {
  count       = length(var.firewall_rules)
  instance_id = cloudamqp_instance.instance.id

  dynamic "rules" {
    for_each = var.firewall_rules
    content {
      description = rules.value["description"]
      ip          = rules.value["ip"]
      ports       = rules.value["ports"]
      services    = rules.value["services"]
    }
  }
}

# New vpc peering connection
resource "cloudamqp_vpc_peering" "vpc_accept_peering" {
  count       = var.vpc_peering_aws_vpc_peering_id == null ? 0 : 1
  instance_id = cloudamqp_instance.instance.id
  peering_id  = var.vpc_peering_aws_vpc_peering_id
}
