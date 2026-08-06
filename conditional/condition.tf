provider "aws" {
  region     = "us-east-1"
}
variable "environment" {
    default = "production"
}
resource "aws_instance" "myec2" {
  ami           = "ami-02b64aa047cb5edf5"
  instance_type = var.environment == "development" ? "t3.micro" : "m5.large"
}