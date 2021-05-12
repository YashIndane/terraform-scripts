provider "aws" {

  region = "ap-south-1"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "os4"{

 ami = "ami-010aff33ed5991201"
 instance_type = "t2.small"
 key_name = ""
 tags = {
     Name = "httpd_server1"

   }
}

resource "aws_ebs_volume" "example3" {
  availability_zone = aws_instance.os4.availability_zone
  size              = 8

  tags = {
    Name = "mydisk2"
  }
}

resource "aws_volume_attachment" "ebs_att3" {

  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.example3.id
  instance_id = aws_instance.os4.id

}

resource "null_resource" "re3" {

connection {

  type = "ssh"
  user = "ec2-user"
  private_key = file("")
  host = aws_instance.os4.public_ip

}

provisioner "remote-exec" {

  inline = [
           "sudo yum install httpd -y",
           "sudo yum install git -y",
           "sudo mkfs.ext4 /dev/xvdc",
           "sudo mount /dev/xvdc /var/www/html",
           "sudo git clone https://github.com/vimallinuxworld13/gitphptest.git /web",
           "sudo mv /web/index.php /var/www/html",
           "sudo systemctl start httpd"
           ]
}

provisioner "local-exec" {

 command = "firefox http://{aws_instance.os4.public_ip}/index.php"

}
}
