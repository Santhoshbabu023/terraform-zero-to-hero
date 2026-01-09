provider "aws" {
    region = "us-east-2"  
}

resource "aws_instance" "example" {
    ami           = "ami-07ff62358b87c7116"  
    instance_type = "t2.micro"
    subnet_id = "subnet-0b43a69695dca3092"
    key_name = "Terraform"
}