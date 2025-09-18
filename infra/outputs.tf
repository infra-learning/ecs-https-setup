output "alb_dns" {
  value = aws_lb.app.dns_name
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}
