provider "aws"{

  region = "ap-south-1"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "os1"{

 ami = "ami-0de1d9ec99cd6630c"
 instance_type = "t2.small"
 tags = {
     Name = "hadoop-os-1"

   }
}

resource "aws_instance" "os2"{

 ami = "ami-0de1d9ec99cd6630c"
 instance_type = "t2.micro"
 tags = {
     Name = "hadoop-os-2"

   }
}
