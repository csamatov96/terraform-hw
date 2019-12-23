resource "aws_subnet" "public1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.2.0/24"

  tags = {
    Name = "public2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.3.0/24"

  tags = {
    Name = "public3"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.11.0/24"

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.12.0/24"

  tags = {
    Name = "private2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "192.168.13.0/24"

  tags = {
    Name = "private3"
  }
}