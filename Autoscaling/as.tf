provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
  }

#Launch Configuration
resource "aws_launch_configuration" "launch_conf" {
  name   = "vineet"
  image_id      = "ami-04328208f4f0cf1fe"
  instance_type = "t2.micro" 
}

#AutoScaling group
resource "aws_autoscaling_group" "asg" {
  name                 = "vineetas"
  launch_configuration = "${aws_launch_configuration.launch_conf.name}"
  min_size             = 2
  max_size             = 4
  vpc_zone_identifier       = ["subnet-0c82b564", "subnet-0e355974", "subnet-273feb6b"]
  tags {
    key = "Name"
    value = "Web-autoscaling-group"
    propagate_at_launch = true
  } 
  }
  