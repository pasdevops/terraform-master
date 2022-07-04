terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
      }
    }
}
provider "aws" {
    region = us-east-1
    profile = "terraform_env"
  
}

// these modules are derived from  networking.tf files
module "my_vpc"{
    source      = "../modules/vpc"
    vpc_cidr    = "192.168.0.0/16"
    tennancy    = "default"
    vpc_id      =  module.my_vpc.vpc_id
    subnet_cidr = "192.168.0.0/24"
}   
// these modules are derived from instance.tf files
module "my_ec2"{
    source          = "../modules/ec2"
    count           = 1
    ami_id          = "ami-5a8da735"
    instance_type   = "t2.micro"
    subnet_id       =  module.my_vpc.subnet_id
}


 // THIS IS HOW TO RE-USE CODE IN TERRAFORM

 // One directory back??
 // AMI ID is REGION specific - beaware of regions
 // In PROD END, you can change all the values rather than the KEYS. 
// Source can be in the same workspace or in a diff remote repo/location to maintain modules
// Outside MODULES, anything you want to ACCESS, define them as OUTPUT. 
// Main.tf is where resouces for each enviroment will be defined such as DEV,PROD,TEST etc. 