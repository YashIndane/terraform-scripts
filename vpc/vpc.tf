resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = var.gw_name
  }
}

resource "aws_subnet" "mysn" {
  count = length(var.cidrs) 
  vpc_id = aws_vpc.myvpc.id
  cidr_block = element(var.cidrs , count.index)
  availability_zone = "ap-south-1b"
  tags = {
    Name = "terrasub-${count.index + 1}"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygw.id
  }
  tags = {
    Name = "terrart"
  }
}

resource "aws_route_table_association" "myasc" {
  count = length(var.cidrs)
  subnet_id = element(aws_subnet.mysn.*.id , count.index)
  route_table_id = aws_route_table.myrt.id
}

resource "aws_instance" "myin" {
  count = length(var.ins_name)
  ami = var.ins_ami
  instance_type = var.ins_type
  subnet_id = element(aws_subnet.mysn.*.id , count.index)
  associate_public_ip_address = true
  tags = {
    Name = "${element(var.ins_name , count.index)}"
  }
}
