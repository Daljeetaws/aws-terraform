terraform {
  cloud {
    organization = "daljeet-org"

    workspaces {
      name = "cli-driven-workflow"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}
resource "aws_security_group" "allow_tls" {
  name        = "terraform firewall"
  description = "managed from terraform"

}