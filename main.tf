provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-0d9462a653c34dab7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    user_data = file("file.sh")


    tags = {
        Name = "terraform-example"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

variable "server_port" {
    description = "Server port"
    default = 8080
}

output "public_ip" {
    value = aws_instance.example.public_ip
}