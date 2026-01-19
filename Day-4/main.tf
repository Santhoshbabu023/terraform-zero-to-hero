provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "Santhosh" {
  instance_type = "t2.micro"
  ami = data.aws_ami.amazon_linux.id
  subnet_id = data.aws_subnets.selected.ids[0]
}