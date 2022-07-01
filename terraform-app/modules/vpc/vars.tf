variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
// If you want to make some default value optional, then put some default value. 

variable "tennancy" {
  default = "dedicated"
}
variable "vpc_id" {
 
}
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
// default = none
// If you want to make a varibale mandatory, don't put any default value.
