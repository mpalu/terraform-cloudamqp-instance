<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_cloudamqp"></a> [cloudamqp](#requirement\_cloudamqp) | ~>1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudamqp"></a> [cloudamqp](#provider\_cloudamqp) | ~>1.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudamqp_alarm.connection_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.consumer_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.cpu_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.disk_space_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.memory_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.notice_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.queue_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_alarm.server_unreachable_alarm](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/alarm) | resource |
| [cloudamqp_custom_domain.custom_domain](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/custom_domain) | resource |
| [cloudamqp_instance.instance](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/instance) | resource |
| [cloudamqp_integration_log.cloudwatch](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.datadog](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.logentries](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.loggly](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.papertrail](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.splunk](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_log.stackdriver](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_log) | resource |
| [cloudamqp_integration_metric.cloudwatch](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_metric) | resource |
| [cloudamqp_integration_metric.datadog](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_metric) | resource |
| [cloudamqp_integration_metric.librato](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_metric) | resource |
| [cloudamqp_integration_metric.newrelic](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_metric) | resource |
| [cloudamqp_integration_metric.stackdriver](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/integration_metric) | resource |
| [cloudamqp_notification.recipient](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/notification) | resource |
| [cloudamqp_plugin.plugin](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/plugin) | resource |
| [cloudamqp_plugin_community.plugin](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/plugin_community) | resource |
| [cloudamqp_security_firewall.firewall_settings](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/security_firewall) | resource |
| [cloudamqp_vpc_peering.vpc_accept_peering](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/vpc_peering) | resource |
| [cloudamqp_webhook.webhook](https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/resources/webhook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_connection_enable"></a> [alarm\_connection\_enable](#input\_alarm\_connection\_enable) | Enable or disable the alarm to trigger | `bool` | `false` | no |
| <a name="input_alarm_connection_recipients"></a> [alarm\_connection\_recipients](#input\_alarm\_connection\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_connection_time_threshold"></a> [alarm\_connection\_time\_threshold](#input\_alarm\_connection\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `null` | no |
| <a name="input_alarm_connection_value_threshold"></a> [alarm\_connection\_value\_threshold](#input\_alarm\_connection\_value\_threshold) | An alarm will be sent when the number of connections are more than the value threshold for more than number of seconds in the time threshold | `number` | `null` | no |
| <a name="input_alarm_consumer_enable"></a> [alarm\_consumer\_enable](#input\_alarm\_consumer\_enable) | Enable or disable the alarm to trigger | `bool` | `false` | no |
| <a name="input_alarm_consumer_queue_regex"></a> [alarm\_consumer\_queue\_regex](#input\_alarm\_consumer\_queue\_regex) | Regex for which queue to check | `string` | `null` | no |
| <a name="input_alarm_consumer_recipients"></a> [alarm\_consumer\_recipients](#input\_alarm\_consumer\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_consumer_time_threshold"></a> [alarm\_consumer\_time\_threshold](#input\_alarm\_consumer\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `null` | no |
| <a name="input_alarm_consumer_value_threshold"></a> [alarm\_consumer\_value\_threshold](#input\_alarm\_consumer\_value\_threshold) | The value to trigger the alarm for | `number` | `null` | no |
| <a name="input_alarm_consumer_vhost_regex"></a> [alarm\_consumer\_vhost\_regex](#input\_alarm\_consumer\_vhost\_regex) | Regex for which vhost to check | `string` | `null` | no |
| <a name="input_alarm_cpu_enable"></a> [alarm\_cpu\_enable](#input\_alarm\_cpu\_enable) | Enable or disable the alarm to trigger | `bool` | `true` | no |
| <a name="input_alarm_cpu_recipients"></a> [alarm\_cpu\_recipients](#input\_alarm\_cpu\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_cpu_time_threshold"></a> [alarm\_cpu\_time\_threshold](#input\_alarm\_cpu\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `600` | no |
| <a name="input_alarm_cpu_value_threshold"></a> [alarm\_cpu\_value\_threshold](#input\_alarm\_cpu\_value\_threshold) | The value to trigger the alarm for | `number` | `90` | no |
| <a name="input_alarm_disk_space_enable"></a> [alarm\_disk\_space\_enable](#input\_alarm\_disk\_space\_enable) | Enable or disable the alarm to trigger | `bool` | `true` | no |
| <a name="input_alarm_disk_space_recipients"></a> [alarm\_disk\_space\_recipients](#input\_alarm\_disk\_space\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_disk_space_time_threshold"></a> [alarm\_disk\_space\_time\_threshold](#input\_alarm\_disk\_space\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `600` | no |
| <a name="input_alarm_disk_space_value_threshold"></a> [alarm\_disk\_space\_value\_threshold](#input\_alarm\_disk\_space\_value\_threshold) | The value to trigger the alarm for | `number` | `5` | no |
| <a name="input_alarm_memory_enable"></a> [alarm\_memory\_enable](#input\_alarm\_memory\_enable) | Enable or disable the alarm to trigger | `bool` | `true` | no |
| <a name="input_alarm_memory_recipients"></a> [alarm\_memory\_recipients](#input\_alarm\_memory\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_memory_time_threshold"></a> [alarm\_memory\_time\_threshold](#input\_alarm\_memory\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `600` | no |
| <a name="input_alarm_memory_value_threshold"></a> [alarm\_memory\_value\_threshold](#input\_alarm\_memory\_value\_threshold) | The value to trigger the alarm for | `number` | `80` | no |
| <a name="input_alarm_notice_enable"></a> [alarm\_notice\_enable](#input\_alarm\_notice\_enable) | Enable or disable the alarm to trigger | `bool` | `true` | no |
| <a name="input_alarm_notice_recipients"></a> [alarm\_notice\_recipients](#input\_alarm\_notice\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_queue_enable"></a> [alarm\_queue\_enable](#input\_alarm\_queue\_enable) | Enable or disable the alarm to trigger | `bool` | `false` | no |
| <a name="input_alarm_queue_message_type"></a> [alarm\_queue\_message\_type](#input\_alarm\_queue\_message\_type) | Message type (total, unacked, ready) used by queue alarm type. | `string` | `null` | no |
| <a name="input_alarm_queue_recipients"></a> [alarm\_queue\_recipients](#input\_alarm\_queue\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_queue_regex"></a> [alarm\_queue\_regex](#input\_alarm\_queue\_regex) | Regex for which queue to check | `string` | `null` | no |
| <a name="input_alarm_queue_time_threshold"></a> [alarm\_queue\_time\_threshold](#input\_alarm\_queue\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `null` | no |
| <a name="input_alarm_queue_value_threshold"></a> [alarm\_queue\_value\_threshold](#input\_alarm\_queue\_value\_threshold) | The value to trigger the alarm for | `number` | `null` | no |
| <a name="input_alarm_queue_vhost_regex"></a> [alarm\_queue\_vhost\_regex](#input\_alarm\_queue\_vhost\_regex) | Regex for which vhost to check | `string` | `null` | no |
| <a name="input_alarm_server_unreachable_enable"></a> [alarm\_server\_unreachable\_enable](#input\_alarm\_server\_unreachable\_enable) | Enable or disable the alarm to trigger | `bool` | `true` | no |
| <a name="input_alarm_server_unreachable_recipients"></a> [alarm\_server\_unreachable\_recipients](#input\_alarm\_server\_unreachable\_recipients) | Identifier for recipient to be notified | `list(number)` | `null` | no |
| <a name="input_alarm_server_unreachable_time_threshold"></a> [alarm\_server\_unreachable\_time\_threshold](#input\_alarm\_server\_unreachable\_time\_threshold) | The time interval (in seconds) the value\_threshold should be active before triggering an alarm | `number` | `150` | no |
| <a name="input_cloudamqp_customer_api_key"></a> [cloudamqp\_customer\_api\_key](#input\_cloudamqp\_customer\_api\_key) | API key needed to communicate to CloudAMQP's API | `string` | n/a | yes |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | Custom domain for the CloudAMQP instance | `string` | `null` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | An array of rules, minimum of 1 needs to be configured | <pre>map(object({<br>    description = string<br>    ip          = string<br>    ports       = list(number)<br>    services    = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the CloudAMQP instance | `string` | n/a | yes |
| <a name="input_instance_no_default_alarms"></a> [instance\_no\_default\_alarms](#input\_instance\_no\_default\_alarms) | Set to true to discard creating default alarms when the instance is created | `bool` | `true` | no |
| <a name="input_instance_plan"></a> [instance\_plan](#input\_instance\_plan) | The subscription plan. See available plans https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/guides/info_plan | `string` | n/a | yes |
| <a name="input_instance_region"></a> [instance\_region](#input\_instance\_region) | The region to host the instance in. See Instance regions https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs/guides/info_region | `string` | n/a | yes |
| <a name="input_instance_rmq_version"></a> [instance\_rmq\_version](#input\_instance\_rmq\_version) | The Rabbit MQ version. Note: There is not yet any support in the provider to change the RMQ version. Once it's set in the initial creation, it will remain | `string` | `null` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | One or more tags for the CloudAMQP instance, makes it possible to categories multiple instances in console view | `list(string)` | `[]` | no |
| <a name="input_instance_vpc_id"></a> [instance\_vpc\_id](#input\_instance\_vpc\_id) | The VPC ID. Use this to create your instance in an existing VPC | `string` | `null` | no |
| <a name="input_instance_vpc_subnet"></a> [instance\_vpc\_subnet](#input\_instance\_vpc\_subnet) | Creates a dedicated VPC subnet, shouldn't overlap with other VPC subnet, default subnet used 10.56.72.0/24. NOTE: extra fee will be charged when using VPC | `string` | `null` | no |
| <a name="input_integration_aws_access_key_id"></a> [integration\_aws\_access\_key\_id](#input\_integration\_aws\_access\_key\_id) | AWS access key identifier | `string` | `null` | no |
| <a name="input_integration_aws_region"></a> [integration\_aws\_region](#input\_integration\_aws\_region) | Region hosting the integration service | `string` | `null` | no |
| <a name="input_integration_aws_secret_access_key"></a> [integration\_aws\_secret\_access\_key](#input\_integration\_aws\_secret\_access\_key) | AWS secret access key | `string` | `null` | no |
| <a name="input_integration_datadog_api_key"></a> [integration\_datadog\_api\_key](#input\_integration\_datadog\_api\_key) | The integration API key | `string` | `null` | no |
| <a name="input_integration_datadog_region"></a> [integration\_datadog\_region](#input\_integration\_datadog\_region) | Region hosting the integration service | `string` | `null` | no |
| <a name="input_integration_datadog_tags"></a> [integration\_datadog\_tags](#input\_integration\_datadog\_tags) | Tag the integration, e.g. env=prod, region=europe | `string` | `null` | no |
| <a name="input_integration_librato_api_key"></a> [integration\_librato\_api\_key](#input\_integration\_librato\_api\_key) | The integration API key | `string` | `null` | no |
| <a name="input_integration_librato_email"></a> [integration\_librato\_email](#input\_integration\_librato\_email) | The client email registered for the integration service | `string` | `null` | no |
| <a name="input_integration_logentries_token"></a> [integration\_logentries\_token](#input\_integration\_logentries\_token) | Token used for authentication | `string` | `null` | no |
| <a name="input_integration_loggly_token"></a> [integration\_loggly\_token](#input\_integration\_loggly\_token) | Token used for authentication | `string` | `null` | no |
| <a name="input_integration_newrelic_api_key"></a> [integration\_newrelic\_api\_key](#input\_integration\_newrelic\_api\_key) | The integration API key | `string` | `null` | no |
| <a name="input_integration_newrelic_region"></a> [integration\_newrelic\_region](#input\_integration\_newrelic\_region) | Region hosting the integration service | `string` | `null` | no |
| <a name="input_integration_papertrail_url"></a> [integration\_papertrail\_url](#input\_integration\_papertrail\_url) | Endpoint to log integration | `string` | `null` | no |
| <a name="input_integration_splunk_host_port"></a> [integration\_splunk\_host\_port](#input\_integration\_splunk\_host\_port) | Destination to send the logs | `number` | `null` | no |
| <a name="input_integration_splunk_token"></a> [integration\_splunk\_token](#input\_integration\_splunk\_token) | Token used for authentication | `string` | `null` | no |
| <a name="input_integration_stackdriver_client_email"></a> [integration\_stackdriver\_client\_email](#input\_integration\_stackdriver\_client\_email) | The client email registered for the integration service | `string` | `null` | no |
| <a name="input_integration_stackdriver_private_key"></a> [integration\_stackdriver\_private\_key](#input\_integration\_stackdriver\_private\_key) | The private access key | `string` | `null` | no |
| <a name="input_integration_stackdriver_project_id"></a> [integration\_stackdriver\_project\_id](#input\_integration\_stackdriver\_project\_id) | The project identifier | `string` | `null` | no |
| <a name="input_notification_recipients"></a> [notification\_recipients](#input\_notification\_recipients) | Recipients to receive alarm notifications | <pre>list(object({<br>    type  = string<br>    value = string<br>    name  = string<br>  }))</pre> | `[]` | no |
| <a name="input_plugin_activaction"></a> [plugin\_activaction](#input\_plugin\_activaction) | The set of names of the Rabbit MQ plugins | <pre>list(object({<br>    name    = string<br>    enabled = bool<br>  }))</pre> | `[]` | no |
| <a name="input_plugin_community_activaction"></a> [plugin\_community\_activaction](#input\_plugin\_community\_activaction) | The set of names of community the Rabbit MQ plugins | <pre>list(object({<br>    name    = string<br>    enabled = bool<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_peering_aws_vpc_peering_id"></a> [vpc\_peering\_aws\_vpc\_peering\_id](#input\_vpc\_peering\_aws\_vpc\_peering\_id) | Peering identifier created by AWS peering request | `string` | `null` | no |
| <a name="input_webhook_concurrency"></a> [webhook\_concurrency](#input\_webhook\_concurrency) | Max simultaneous requests to the endpoint | `number` | `null` | no |
| <a name="input_webhook_queue"></a> [webhook\_queue](#input\_webhook\_queue) | A (durable) queue on your RabbitMQ instance | `string` | `null` | no |
| <a name="input_webhook_retry_interval"></a> [webhook\_retry\_interval](#input\_webhook\_retry\_interval) | How often we retry if your endpoint fails (in seconds) | `number` | `null` | no |
| <a name="input_webhook_uri"></a> [webhook\_uri](#input\_webhook\_uri) | A POST request will be made for each message in the queue to this endpoint | `string` | `null` | no |
| <a name="input_webhook_vhost"></a> [webhook\_vhost](#input\_webhook\_vhost) | The vhost the queue resides in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The identifier (instance\_id) for this resource, used as a reference by almost all other resource and data source |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | Name of the CloudAMQP instance |
| <a name="output_instance_plan"></a> [instance\_plan](#output\_instance\_plan) | The subscription plan |
| <a name="output_instance_region"></a> [instance\_region](#output\_instance\_region) | The region to host the instance in |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC ID |
| <a name="output_vpc_subnet"></a> [vpc\_subnet](#output\_vpc\_subnet) | The VPC Subnet |
<!-- END_TF_DOCS -->
