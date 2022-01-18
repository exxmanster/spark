resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  tags = {
    Name = "main"
  }
}

resource "aws_eip" "nat_gateway-1a" {
  vpc = true
}

resource "aws_eip" "nat_gateway-1b" {
  vpc = true
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_nat_gateway" "gw-NAT-1a" {
  allocation_id = aws_eip.nat_gateway-1a.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gw-NAT-1a"
  }
}

resource "aws_nat_gateway" "gw-NAT-1b" {
  allocation_id = aws_eip.nat_gateway-1b.id
  subnet_id     = aws_subnet.public2.id

  tags = {
    Name = "gw-NAT-1b"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.private_subnet1_cidr}"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "privat1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.private_subnet2_cidr}"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "privat2"


  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.public_subnet1_cidr}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public1"

  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.public_subnet2_cidr}"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "public2"


  }
}

resource "aws_route_table" "pub-RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "pub-RT"
  }
}

resource "aws_route_table" "priv-RT-1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-NAT-1a.id
  }

  tags = {
    Name = "priv-RT-1a"
  }
}

resource "aws_route_table" "priv-RT-1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-NAT-1b.id
  }

  tags = {
    Name = "priv-RT-1b"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_route_table_association" "public-1b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_route_table_association" "private-1a" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.priv-RT-1a.id
}

resource "aws_route_table_association" "private-1b" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.priv-RT-1b.id
}
