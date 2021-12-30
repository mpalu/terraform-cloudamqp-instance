output "instance_name" {
  description = "Name of the CloudAMQP instance"
  value       = cloudamqp_instance.instance.name
}

output "instance_plan" {
  description = "The subscription plan"
  value       = cloudamqp_instance.instance.plan
}

output "instance_region" {
  description = "The region to host the instance in"
  value       = cloudamqp_instance.instance.region
}

output "instance_id" {
  description = "The identifier (instance_id) for this resource, used as a reference by almost all other resource and data source"
  value       = cloudamqp_instance.instance.id
}

output "vpc_id" {
  description = "The VPC ID"
  value       = cloudamqp_instance.instance.vpc_id
}

output "vpc_subnet" {
  description = "The VPC Subnet"
  value       = cloudamqp_instance.instance.vpc_subnet
}
