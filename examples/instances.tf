module "cloudamqp_instance_name_of_my_instance" {
  source  = "mpalu/instance/cloudamqp"
  version = "0.0.1"

  cloudamqp_customer_api_key = var.cloudamqp_customer_api_key
  instance_name              = "name-of-my-instance"
  instance_plan              = "squirrel-1"
  instance_tags = [
    "environment: production",
    "team_name: team-name",
    "contact: my-mail@my-domain.com"
  ]
  notification_recipients = [
    {
      type  = "webhook"
      value = "https://127.0.0.1/webhook-endpoint"
      name  = "pagerduty"
    },
    {
      type  = "slack"
      value = "https://127.0.0.1/slack-endpoint"
      name  = "#my-channel"
    }
  ]
  plugin_activaction = [
    {
      name    = "rabbitmq_top"
      enabled = true
    },
    {
      name    = "rabbitmq_amqp1_0"
      enabled = false
    },
  ]
  plugin_community_activaction = [
    {
      name    = "rabbitmq_delayed_message_exchange"
      enabled = true
    },
    {
      name    = "rabbitmq_amqp1_0"
      enabled = false
    },
  ]
  firewall_rules = {
    rule = {
      description = "allow ec2 vpc"
      ip          = "192.168.0.0/24"
      ports       = [4567, 4568]
      services    = ["AMQP", "AMQPS", "HTTPS"]
    }
    rule2 = {
      description = "allow eks vpc"
      ip          = "10.56.72.0/24"
      ports       = []
      services    = ["AMQP", "AMQPS"]
    }
  }
}
