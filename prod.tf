provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "mazzy-simple-bucket"
    key    = "techbleat.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_instance" "first_task" {
  ami             = "ami-0bfbfa28c5682b543"
  instance_type   = "t2.micro"
  key_name        = "MyNewPair"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name        = "1 ToolBox"
    Provisioner = "Terraform"
    Test        = "yes_no"
  }
}
resource "aws_instance" "second_node" {
  ami                    = "ami-0bfbfa28c5682b543"
  instance_type          = "t2.micro"
  key_name               = "MyNewPair"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name        = "2 ToolBox"
    Provisioner = "Terraform"
  }
}