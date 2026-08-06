provider "aws" {
  region     = "us-east-1"
}
/*variable "usr-names"{
    type = set(string)
    default = ["daljeet","surinder","jatinder","jasbir"]
}
resource "aws_iam_user" "users"{
    for_each = var.usr-names
    name = each.value
}*/

variable "my-map" {
    type = map
    default = {
        key = "value"
        key1 = "value1"
    }
}

resource "aws_instance" "web"{
    for_each = var.my-map
    ami = each.value
    instance_type = "t3.micro"

    tags = {
        Name = each.key
    }
}