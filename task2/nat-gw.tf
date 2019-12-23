variable "aws_nat_ami" {
    default = {
        us-east-1 = "ami-01623d7b"
        us-east-2 = "ami-021e3167"
    }
}

resource "aws_instance" "nat" {
	ami = "${lookup(var.aws_nat_ami, var.aws_region)}"
	instance_type = "t2.micro"
	key_name = "static-nat"
	security_groups = ["${aws_security_group.nat.id}"]
	subnet_id = "${aws_subnet.public1.id}"
	associate_public_ip_address = true
	source_dest_check = false
	user_data = "${file("nat-user-data.yml")}"
	tags {
		Name = "nat"
	}
}

resource "aws_eip" "nat" {
	instance = "${aws_instance.nat.id}"
	vpc = true
}

resource "aws_security_group" "nat" {
	name = "nat"
	description = "Allow services from the private subnet through NAT"
	vpc_id = "${aws_vpc.main.id}"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		security_groups = ["${aws_security_group.private.id}"]
	}

	ingress {
		from_port = 0
		to_port = 65535
		protocol = "udp"
		security_groups = ["${aws_security_group.private.id}"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags {
		Name = "${var.aws_vpc_name}-nat"
	}
}