provider "aws" {
  region     = "us-east-1"
}
resource "aws_security_group" "allow_tls" {
  name        = "terraform firewall"
  description = "managed from terraform"

}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.http_port
  ip_protocol       = "tcp"
  to_port           = var.http_port
  description = "HTTP port"
   tags = {
    Name = "this is HTTP port"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
  description = "SSH Port"
   tags = {
    Name = "this is SSH port"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ftp" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port
  description = "FTP port"
   tags = {
    Name = "this is FTP port"
  }
}
