/*
# Configure the AWS Provider

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_access_key}"
  region     = "${var.aws_region}"
}




# Create a web server
resource "aws_instance" "SuseLinuxEc2" {
  ami = "ami-0b88036ed476c7dfb"
  instance_type = "t2.micro"
  #Insert the exisiting Key-Name present in account
  key_name = "EC2-Linux-SuSe"
  #Insert the exisiting security group  present in account
  #security_groups = ["launch-wizard-1"]
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  tags {
    Name = "Terraform-EC2-SuSe"
  }
}


#Getting the o/p varriable 
output "public_ip" {
    value = "${aws_instance.SuseLinuxEc2.public_ip}"
}


#Creating Security Groups
resource "aws_security_group" "allow_ssh" {
  name = "terraform-example-instance"
  ingress {
    from_port = 0
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
  Name = "Allow SSH"
  }
}
*/

