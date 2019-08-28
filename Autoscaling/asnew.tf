provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
  version = "1.55.0"
  }

  #AutoScaling group
resource "aws_autoscaling_group" "asg" {
  name                 = "${var.name}"
  launch_configuration = "${aws_launch_configuration.launch_conf.name}"
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  vpc_zone_identifier       = "${var.subnet_ids}"
  tags {
    key = "Namenew"
    value = "Web-autoscaling-group"
    propagate_at_launch = true
  } 
  }
  
#Launch Configuration
resource "aws_launch_configuration" "launch_conf" {
  name   = "kalyanac"
  image_id      = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  
  lifecycle {
    create_before_destroy = true
  }  
}


  