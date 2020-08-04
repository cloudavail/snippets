output "target_group_arn" {
  value = aws_lb_target_group.test_target_group.arn
}

output "target_group_id" {
  value = aws_lb_target_group.test_target_group.id
}

output "target_group_arn_suffix" {
  value = aws_lb_target_group.test_target_group.arn_suffix
}

output "target_group_name" {
  value = aws_lb_target_group.test_target_group.name
}
