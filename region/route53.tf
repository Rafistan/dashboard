resource "aws_route53_record" "tunnel_record" {
  name = "tunnel.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id
  records = [
    aws_instance.tunnel.public_ip]
  ttl = 300
}

resource "aws_route53_record" "demos_alb_record" {
  name = "dashboards.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "tools_alb_record" {
  name = "tools.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_tools.dns_name
    zone_id = aws_lb.alb_tools.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "docs_alb_record" {
  name = "docs.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_public_tools.dns_name
    zone_id = aws_lb.alb_public_tools.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "mazda_awareness_alb_record" {
  name = "mazda-awareness-dashboard.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_cibc_alb_record" {
  name = "brand-lift-study-cibc.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_cibc_q1_2021_alb_record" {
  name = "brand-lift-study-cibc-q1-2021.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "brand_lift_study_dunkin_alb_record" {
  name = "brand-lift-study-dunkin.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_redbull_alb_record" {
  name = "brand-lift-study-redbull.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_fidelity_alb_record" {
  name = "brand-lift-study-fidelity.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_glossier_pjx_alb_record" {
  name = "brand-lift-study-glossier-pjx.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "brand_lift_study_jobs_ohio_alb_record" {
  name = "brand-lift-study-jobs-ohio.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "cossette_covid19_results_alb_record" {
  name = "cossette-covid19-results.${var.base_dns_name}"
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    name = aws_lb.alb_demos.dns_name
    zone_id = aws_lb.alb_demos.zone_id
    evaluate_target_health = false
  }
}
