provider "aws" {
  region  = "${var.aws_region}"
  version = "1.55.0"
}

resource aws_autoscaling_group "main" {
  launch_configuration = "${aws_launch_configuration.main.name}"
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  name                 = "${var.name}"
  #tags                 = "${var.tags}"
  vpc_zone_identifier  = "${var.subnet_ids}"

  lifecycle {
    create_before_destroy = true
  }  
}

resource "aws_launch_configuration" "main" {
  image_id      = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  name_prefix   = "${var.name}_"

  lifecycle {
    create_before_destroy = true
  }
}