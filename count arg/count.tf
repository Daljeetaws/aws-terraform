provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "myec2" {
  ami           = "ami-02b64aa047cb5edf5"
  instance_type = "t3.micro"
  count = 3
   tags = {
    Name = "payments-system-${count.index}"
  }
}
variable "names" {
    type = list
    default = ["daljeet","surinder","jatinder","jasbir"]
}
resource "aws_iam_user" "lb" {
  name = var.names[count.index]
  count = 3
}