provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "myec2" {
  ami               = "ami-02b64aa047cb5edf5"
  instance_type     = "t3.micro"
  tags = {
    Name = "my-test-ec2"
  }
}
resource "aws_ec2_instance_state" "my_server_state" {
  instance_id = aws_instance.myec2.id
  state       = "stopped" # Change to "running" to start it back up
}
resource "aws_eip" "eip" {
  instance = aws_instance.myec2.id
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.eip.id
}
