variable "tags" {
  default = {
    Team = "security-team"
   
  }
}
locals {
  default = {
    Team = "security_team"
     Creationdate = "date-${formatdate("DDMMYY",timestamp())}" 
  }
}
resource "aws_security_group" "sg1" {
  name        = "app_firewall"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = local.default
  }

resource "aws_security_group" "sg2" {
  name        = "db_firewall"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = local.default
  }