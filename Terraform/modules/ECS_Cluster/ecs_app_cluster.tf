resource "aws_ecs_cluster" "app_cluster" {
    name = var.cluster_name
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.cluster_name}"
  retention_in_days = 7
}