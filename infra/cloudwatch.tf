resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/hands-on"
  retention_in_days = 7
}
