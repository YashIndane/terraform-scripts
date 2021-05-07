provider "aws"{

  region = "ap-south-1"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "os1"{

  ami = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

}

output "os_details" {

  value = aws_instance.os1.availability_zone

}
