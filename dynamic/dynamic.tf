provider "aws" {
  region = "us-east-1"
}

variable "sg_ports" {
  type    = list(number)
  default = [8200, 8300, 9100, 9500]
}

resource "aws_security_group" "sg1" {
  name = "security-group"

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "myec2" {
  ami                    = "ami-02b64aa047cb5edf5"
  instance_type          = "t3.small"
  vpc_security_group_ids = [aws_security_group.sg1.id]

  tags = {
    Name = "HelloWorld"
  }
}