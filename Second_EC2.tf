#Terraform EC2 Instance spin-off by passing varriable

# Create a web server
resource "aws_instance" "SuseLinuxEc2" {
  count         = "${var.Instance_count}"
  ami           = "${lookup(var.aws_ami_map,var.aws_region)}" #Accessing Map Variable
  instance_type = "${var.aws_instance_type}"

  #Insert the exisiting Key-Name present in account
  key_name = "EC2_Terraform"

  #Insert the exisiting security group  present in account
  #security_groups = ["launch-wizard-1"]
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  tags {
    Name = "Terraform-EC2-SuSe-${count.index}"
    ID   = "Terraform-${element(var.instance_tag_ID,count.index)}" #Accessing List Variable
  }
}

#Creating Security Groups
resource "aws_security_group" "allow_ssh" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow SSH"
  }
}
