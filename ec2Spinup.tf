
# ec2spinup.tf
# pip3 install awscli
# Assigned "Admin Role To ec2 instance/terraform server


provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "ec2-access" {
  key_name = "ec2-access"
  public_key = "<At Shell, ssh-keygen, paste it>"
  # ssh-keygen -f ec2-access
}

resource "aws_instance" "target01" {
  ami = "ami-0f65671a86f061fcd"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.ec2-access.key_name}"
  tags {
     Name = "target01"
  }
}
