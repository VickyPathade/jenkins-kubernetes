
resource "aws_vpc" "cloud" {
  cidr_block       = var.vpc_cidr 
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.tags
  }
}

resource "aws_internet_gateway" "cloud_gw" {
  vpc_id = aws_vpc.cloud.id

  tags = {
    Name = var.tags
  }
}



resource "aws_subnet" "public_cloud_subnet" {
  count                   = var.public_sn_count
  vpc_id                  = aws_vpc.cloud.id
  cidr_block              = var.public_cidrs[count.index]
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = var.tags
  }
}


resource "aws_default_route_table" "internal_cloud_default" {
  default_route_table_id = aws_vpc.cloud.default_route_table_id

  route {
    cidr_block = var.rt_route_cidr_block
    gateway_id = aws_internet_gateway.cloud_gw.id
  }
  tags = {
    Name = var.tags
  }
}

resource "aws_route_table_association" "default" {
  count          = var.public_sn_count
  subnet_id      = aws_subnet.public_cloud_subnet[count.index].id
  route_table_id = aws_default_route_table.internal_cloud_default.id
}