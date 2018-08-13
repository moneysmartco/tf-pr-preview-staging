variable "env" {
  default = "preview"
}

variable "vpc_id" {
  default = ""
}

variable "alb_listener_http_arn" {
  default = ""
}

variable "alb_listener_https_arn" {
  default = ""
}

variable "app_name" {
  default = ""
}

variable "app_name_setup_target_group" {
  description = "Setup app_name target group or not true|false"
  default     = true
}

variable "app_name_setup_listener_rule" {
  description = "Setup app_name listener rules or not true|false"
  default     = true
}

variable "app_name_app_target_group_arn" {
  description = "When referer to existing target group. Use this when app_name_setup_target_group is false"
  default     = ""
}

variable "app_name_app_target_id" {
  description = "Instance id"
  default     = ""
}

variable "app_name_health_check_port" {
  default = "traffic-port"
}

variable "app_name_health_check_path" {
  description = "ALB healhcheck path"
  default     = "/_ping"
}

variable "app_name_health_check_interval" {
  default = 20
}

variable "app_name_health_check_healthy_threshold" {
  default = 2
}

variable "app_name_health_check_unhealthy_threshold" {
  default = 5
}

variable "app_name_domain_priority_init" {
  default = 100
}

variable "app_name_domains" {
  type    = "list"
  default = []
}

variable "app_name_domain_and_url_priority_init" {
  description = "Listener rule priority start with"
  default     = 110
}

variable "app_name_domains_and_urls" {
  type    = "map"
  default = {}
}

variable "app_name_url_priority_init" {
  description = "Listener rule priority start with"
  default     = 120
}

variable "app_name_urls" {
  type    = "list"
  default = []
}

## ECS Service
variable "ecs_cluster" {
  default = ""
}

variable "app_name_service_container_name" {
  description = "This is the name of the container from the registry"
  default     = ""
}

variable "app_name_service_app_port" {
  default = 3000
}

variable "app_name_service_server_cpu" {
  default = 256
}

variable "app_name_service_server_memory" {
  default = 256
}

variable "app_name_task_required_cpu" {
  default = 256
}

variable "app_name_task_required_memory" {
  default = 256
}

variable "app_name_service_server_docker_image" {
  default = "xxx.dkr.ecr.ap-southeast-1.amazonaws.com/sg_app_name:latest"
}

variable "app_name_ecs_service_desired_count" {
  default = 2
}
