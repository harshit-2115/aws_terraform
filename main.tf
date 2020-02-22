provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-0d9462a653c34dab7"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-example"
    }
}