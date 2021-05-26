variable "region" {
  default = "ap-south-1"
}

variable "user-profile" {
  default = ""
}

variable "vpc_cidr" {
  default = "25.25.0.0/16"
}

variable "vpc_name" {
  default = "terravpc"
}

variable "gw_name" {
  default = "terragw"
}

variable "cidrs" {
  type = list
  default = [ "25.25.7.0/24" , "25.25.44.0/24" ]
}

variable "ins_name" {
  type = list
  default = [ "ins-1" , "ins-2" ]
}

variable "ins_type" {
  default = "t2.micro"
}

variable "ins_ami" {
  default = "ami-0de1d9ec99cd6630c"
}
