data "aws_ami" "ecs_optimized" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0.*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["591542846629"] # Amazon
}

module "asg" {
  source = "../../"

  ami_id        = "${data.aws_ami.ecs_optimized.id}"
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
  max_size      = 4
  min_size      = 1
  name          = "ExampleASG"
  subnet_ids    = ["subnet-8ddd28d7", "subnet-f73cc3db", "subnet-76fe563e", "subnet-c4753df8"]
}