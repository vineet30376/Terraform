output "asg_arn" {
  value = "${aws_autoscaling_group.main.arn}"
}