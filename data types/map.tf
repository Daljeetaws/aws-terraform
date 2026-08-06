variable "instance_tags"{
type = map
default ={
    Name = "appserver"
    Environement = "production"
    Location = "delhi"
 }
}
variable "instance"{
type = map
}
output "variable_value" {
  value = var.instance_tags
}