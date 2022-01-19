resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  tags = {
    Name = "main"
  }
}

resource "aws_eip" "nat_gateway-green" {
  vpc = true
}

resource "aws_eip" "nat_gateway-blue" {
  vpc = true
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_nat_gateway" "gw-NAT-green" {
  allocation_id = aws_eip.nat_gateway-green.id
  subnet_id     = aws_subnet.public_green.id

  tags = {
    Name = "gw-NAT-green"
  }
}

resource "aws_nat_gateway" "gw-NAT-blue" {
  allocation_id = aws_eip.nat_gateway-blue.id
  subnet_id     = aws_subnet.public_blue.id

  tags = {
    Name = "gw-NAT-blue"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "private_green" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.private_subnet_green_cidr}"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "private green"
  }
}

resource "aws_subnet" "private_blue" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.private_subnet_blue_cidr}"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "private blue"


  }
}

resource "aws_subnet" "public_green" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.public_subnet_green_cidr}"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_green"

  }
}

resource "aws_subnet" "public_blue" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.public_subnet_blue_cidr}"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "public_blue"


  }
}

resource "aws_subnet" "db_privat_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.db_subnet_cidr}"
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "db_priv_subnet"


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

resource "aws_route_table" "priv-RT-green" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-NAT-green.id
  }

  tags = {
    Name = "priv-RT-green"
  }
}

resource "aws_route_table" "priv-RT-blue" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-NAT-blue.id
  }

  tags = {
    Name = "priv-RT-blue"
  }
}

resource "aws_route_table_association" "public-green" {
  subnet_id      = aws_subnet.public_green.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_route_table_association" "public-blue" {
  subnet_id      = aws_subnet.public_blue.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_route_table_association" "private-green" {
  subnet_id      = aws_subnet.private_green.id
  route_table_id = aws_route_table.priv-RT-green.id
}

resource "aws_route_table_association" "private-blue" {
  subnet_id      = aws_subnet.private_blue.id
  route_table_id = aws_route_table.priv-RT-blue.id
}
