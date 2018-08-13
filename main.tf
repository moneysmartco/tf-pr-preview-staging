resource "random_integer" "priority" {
  min = 1
  max = 10000

  keepers = {
    target_group_arn = "${module.target_group.target_group_arn}"
  }
}

# Target Group
module "target_group" {
  source                           = "github.com/moneysmartco/tf-aws-alb-app?ref=v1.0"
  env                              = "${var.env}"
  vpc_id                           = "${var.vpc_id}"
  alb_listener_http_arn            = "${var.alb_listener_http_arn}"
  alb_listener_https_arn           = "${var.alb_listener_https_arn}"
  app_name                         = "${var.app_name}"
  setup_target_group               = "${var.app_name_setup_target_group}"
  setup_listener_rule              = "${var.app_name_setup_listener_rule}"
  app_target_group_arn             = "${var.app_name_app_target_group_arn}"
  app_target_id                    = "${var.app_name_app_target_id}"
  health_check_port                = "${var.app_name_health_check_port}"
  health_check_path                = "${var.app_name_health_check_path}"
  health_check_interval            = "${var.app_name_health_check_interval}"
  health_check_healthy_threshold   = "${var.app_name_health_check_healthy_threshold}"
  health_check_unhealthy_threshold = "${var.app_name_health_check_unhealthy_threshold}"
  domains                          = "${var.app_name_domains}"
  domain_priority_init             = "${random_integer.priority.result}"
  domains_and_urls                 = "${var.app_name_domains_and_urls}"
  domain_and_url_priority_init     = "${var.app_name_domain_and_url_priority_init}"
  urls                             = "${var.app_name_urls}"
  url_priority_init                = "${var.app_name_url_priority_init}"
}

# ECS Service
module "ecs_service" {
  source                      = "github.com/moneysmartco/tf-aws-ecs-service?ref=v1.0"
  env                         = "${var.env}"
  ecs_cluster                 = "${var.ecs_cluster}"
  project_name                = "${var.app_name}"
  service_container_name      = "${var.app_name_service_container_name}"
  service_app_port            = "${var.app_name_service_app_port}"
  service_server_cpu          = "${var.app_name_service_server_cpu}"
  service_server_memory       = "${var.app_name_service_server_memory}"
  task_required_cpu           = "${var.app_name_task_required_cpu}"
  task_required_memory        = "${var.app_name_task_required_memory}"
  service_server_docker_image = "${var.app_name_service_server_docker_image}"
  ecs_service_desired_count   = "${var.app_name_ecs_service_desired_count}"
  target_group_arn            = "${module.target_group.target_group_arn}"
}
