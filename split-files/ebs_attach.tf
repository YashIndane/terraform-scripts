resource "aws_volume_attachment" "ebs_att" {

depends_on = [
  aws_ebs_volume.example
]

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.os1.id

}

