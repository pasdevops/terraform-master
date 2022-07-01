resource "aws_vpc" "ocelot-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tennancy}"

  tags = {
    Name = "ocelot-vpc"
  }
}
resource "aws_subnet" "ocelot-public-subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "ocelot-subnet-subnet"
  }
}