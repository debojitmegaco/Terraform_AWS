#declare default varriable as string

variable aws_region {
  default = "ap-south-1"
}

variable aws_ami_id {
  default = "ami-025d8258d76079367"
}

variable aws_instance_type {
  default = "t2.micro"
}

variable "Instance_count" {
  default = "2"
}

#declare list variable type
variable "instance_tag_ID" {
  type    = "list"
  default = ["Instance_Tag-0", "Instance_Tag-1"]
}

#declare varriable as map
variable aws_ami_map {
  type = "map"

  default = {
    "ap-south-1"     = "ami-025d8258d76079367"
    "ap-northeast-1" = "ami-09161bc9964f46a98"
  }
}

/*when creating N count for N no. of resources, use * to O/P the 
vaaribale as there will be N number of resoruces Created
*/
output "public_ip" {
  value = "${aws_instance.SuseLinuxEc2.*.public_ip}"
}
