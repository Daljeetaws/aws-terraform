provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "myec2" {
  ami           = "ami-02b64aa047cb5edf5"
  instance_type = var.list[1]
}
variable "list" {
  type = list
  default = ["m5.large","t3.small","t3.medium"]
}
variable "map" {
  type = map
  default = {
    us-east-1="t3.micro"
    us-east-2="t3.small"
    us-west-2="t2.nano"
  }
}
