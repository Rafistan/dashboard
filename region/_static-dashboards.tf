locals {
  covid19toronto_base_path = "/covid19toronto"
  inteljpmeasurementdashboard_base_path = "/intel-jp-measurement-dashboard"
}

module "covid19-toronto" {
  source = "../basic-service"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_path_pattern = local.covid19toronto_base_path
  alb_listener_rule_priority = "1"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "covid19-toronto"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    BASEPATH = local.covid19toronto_base_path
  }
  healthcheck_endpoint = "${local.covid19toronto_base_path}/"
  region = var.region
  service_name = "covid19-toronto"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}


module "intel-jp-measurement-dashboard" {
  source = "../basic-service"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_path_pattern = local.inteljpmeasurementdashboard_base_path
  alb_listener_rule_priority = "9"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "intel-jp-measurement"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    BASEPATH = local.inteljpmeasurementdashboard_base_path
    USER="intel"
    PASSWD="kG)_f5/HjjJ&G(Cc"
  }
  healthcheck_endpoint = "${local.inteljpmeasurementdashboard_base_path}/ping/"
  region = var.region
  service_name = "intel-jp-measurement"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}


module "mazda-awareness-dashboard" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "mazda-awareness-dashboard.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "11"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "mazda-awareness-dashboard"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="mazda"
    PASSWD="Mdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "mazda-awareness-dashboard"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-cibc" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-cibc.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "14"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "brand-lift-study-cibc"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="cibc"
    PASSWD="Cdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "brand-lift-study-cibc"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-cibc-q1-2021" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-cibc-q1-2021.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "18"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "bls-cibc-q1-2021"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="cibc"
    PASSWD="Cdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "bls-cibc-q1-2021"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-fidelity" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-fidelity.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "13"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "brand-lift-study-fidelity"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="fidelity"
    PASSWD="Fdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "brand-lift-study-fidelity"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-glossier-pjx" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-glossier-pjx.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "20"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "bls-glossier-pjx"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="glossier"
    PASSWD="Gdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  repository_prefix = "demos/static"
  service_name = "bls-glossier-pjx"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
  vpc_id = aws_vpc.vpc.id
}

module "brand-lift-study-jobs-ohio" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-jobs-ohio.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "15"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "brand-lift-study-jobs-ohio"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="jobsohio"
    PASSWD="Jdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "brand-lift-study-jobs-ohio"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-dunkin" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-dunkin.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "16"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "brand-lift-study-dunkin"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="dunkin"
    PASSWD="Ddemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "brand-lift-study-dunkin"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "brand-lift-study-redbull" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "brand-lift-study-redbull.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "19"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "brand-lift-study-redbull"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="redbull"
    PASSWD="Rdemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "brand-lift-study-redbull"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "cossette-covid19-results" {
  source = "../basic-service-host-rule"

  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "cossette-covid19-results.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "17"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "cossette-covid19-results"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {

  }
  env_vars = {
    USER="cossette"
    PASSWD="CDemo.123"
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "cossette-covid19-results"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}

module "rafi-step" {
  source = "../basic-service-host-rule"
  
  alb_arn_suffix = aws_lb.alb_demos.arn_suffix
  alb_listener_arn = aws_lb_listener.alb_listener_demos_ssl.arn
  alb_listener_rule_host_pattern = "rafi-step.${trimsuffix(var.base_dns_name, ".")}"
  alb_listener_rule_priority = "21"
  container_port = "80"
  default_tags = merge(var.default_tags, {DEMOS-SERVICE = "rafi-step"})
  ecs_cluster_id = aws_ecs_cluster.demos_cluster.id
  ecs_cluster_name = aws_ecs_cluster.demos_cluster.name
  ecs_task_execution_role_arn = var.ecs_task_execution_role_arn
  ecs_task_role_arn = var.ecs_task_role_arn
  env_secrets = {
  
  }
  healthcheck_endpoint = "/ping/"
  region = var.region
  service_name = "rafi-step"
  service_security_group = aws_security_group.demos_service_security_group.id
  sns_cloudwatch_topic_arn = aws_sns_topic.cloudwatch_alarms.arn
  subnet_ids = aws_subnet.private_subnets.*.id
  vpc_id = aws_vpc.vpc.id
  repository_prefix = "demos/static"
  task_def_template_path = "${path.root}/task-definitions/single-service.tmpl"
}