variable "access_key" {}
variable "secret_key" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "igw_name" {}
variable "region" {}
variable "env" {}
variable "public_subnets" {
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "public_cidrs" {
    type = list
    default = ["10.40.1.0/24","10.40.2.0/24","10.40.3.0/24","10.40.4.0/24","10.40.5.0/24","10.40.6.0/24"]
}
variable "private_subnets" {
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "private_cidrs" {
    type = list
    default = ["10.40.10.0/24","10.40.20.0/24","10.40.30.0/24","10.40.40.0/24","10.40.50.0/24","10.40.60.0/24"]
}

variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-042e8287309f5df03" # ubuntu 20.04 LTS
		us-east-2 = "ami-08962a4068733a2b6" # ubuntu 20.04 LTS
    }
}




