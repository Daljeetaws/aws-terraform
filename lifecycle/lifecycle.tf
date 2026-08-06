provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"

   tags = {
    Name = "Development"
  }

  lifecycle {
    prevent_destroy = true
  }

    lifecycle {
    create_before_destroy = true
  }

      lifecycle {
    ignore_changes = [ tags ]
  }
}