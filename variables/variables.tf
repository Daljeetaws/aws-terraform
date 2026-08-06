variable "ssh_port" {
}
variable "http_port" {
  type = number
  default     = 80
  description = "This is a HTTP port for the server"
}
variable "ftp_port" {
  type = number
  default     = 21
  description = "This is FTP port for the server"
}
variable "vpn_ip" {
  default     = "10.21.34.56/32"
  description = "This is an IP for an EC2 Instance"
}
variable "mylist"{
    type = list(number)
    default = [ "1","2","3"]
}