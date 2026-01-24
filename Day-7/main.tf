provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://3.148.182.112:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "15778362-e668-65b2-8939-e549028595a8"
      secret_id = "6f9ed5a4-13a2-c21d-5b7e-89bce22ccf94"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test_secret" // change it according to your secret
}

resource "aws_instance" "my-vault" {
  ami           = data.aws_ami.amazon_linux.id
  subnet_id = data.aws_subnets.selected.ids[0]
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
