terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
resource "aws_instance" "myec2" {
  ami           = "ami-02b64aa047cb5edf5"
  instance_type = "t3.small"

  tags = {
    Name = "my-first-ec2"
  }
}