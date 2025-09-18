resource "aws_acm_certificate" "hands_on" {
  domain_name       = "salary-man-bottleneck.com"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "hands-on-cert"
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.hands_on.domain_validation_options : dvo.domain_name => dvo
  }

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "hands_on" {
  certificate_arn         = aws_acm_certificate.hands_on.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
