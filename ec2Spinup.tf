
# ec2spinup.tf

# ON EC2 Instance ...
# mkdir <terraform-depot>
# Install Hashicorp Binary @
# https://www.terraform.io/
# unzip file ... 
# Setup path for BINARY ...
# echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
# source ~/.bash_profile
# terraform init
# Get AMI Image ID @

# FINDING AMI'S
# https://cloud-images.ubuntu.com/locator/ec2/
# https://wiki.centos.org/Cloud/AWS
-------------------------------------------
Finding AMI ids
If you want to use find the ami ids with the api, you can use the product code to search 
in each region. Keep in mind that multiple AMI ids may be associated with a product key. 
These correspond to different releases of the product. 
Here's an example command using awscli in us-east-1 to find the CentOS-7 images:  
$ aws --region us-east-1 ec2 describe-images --owners aws-marketplace --filters Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce



# create ec2.tf or whatever ...
# Start coding 

# EC2 access to VPC/API 
# pip3 install awscli
# Assigned "Admin Role To ec2 instance/terraform server



provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "ec2-access" {
  key_name = "ec2-access"
  public_key = "<paste public key here ...>"
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



# Example-2
provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "ec2-acc1" {
  key_name = "ec2-acc1"
  public_key = "<paste pubkey here>"
}

resource "aws_instance" "target01" {
  ami = "ami-0f65671a86f061fcd"
  instance_type = "t2.micro"
  key_name = "ec2-acc1"
  tags {
     Name = "target01"
  }
}










