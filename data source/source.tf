provider "aws" {
  region     = "us-east-1"
}
data "aws_ami" "myimage"{
  most_recent = true
    owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "myec2"{
  ami           = data.aws_ami.myimage.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
/*
data "local_file" "foo"{
    filename = "${path.module}/demo.txt"
} */
/*
data "aws_instances" "example"{}
*/

/*
output "data"{
    value = data.local_file.foo.content
} */
/*
data "aws_instance" "example"{
    instance_id = "i-0262ef955d412aceb"
  filter {
    name   = "tag:Environment"
    values = ["Producion"]
  }
}*/