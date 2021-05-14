resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 8

  tags = {
    Name = "HelloWorld"
  }
}

