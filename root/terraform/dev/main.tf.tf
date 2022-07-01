provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAINMZOMDIVAK74IVA"
  secret_key = "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"
}
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Team Leader"
  }
}
resource "aws_instance" "my-first-web-server" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  tags = {
    Name = "Linux Servers"
  }
}
resource "aws_s3_bucket" "b" {
  bucket = "mybucket2022"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_vpc" "FirstVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Production"
  }
}

resource "aws_subnet" "Subnet-1" {
  vpc_id     = aws_vpc.FirstVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet-one"
  }
}

