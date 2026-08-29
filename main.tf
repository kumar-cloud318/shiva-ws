provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket       = "shiva-state-bucket"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

resource "aws_instance" "mumbaiserver" {
  count                  = 3
  ami                    = "ami-0ac7b260cf76d8865"
  instance_type          = "t3.micro"
  key_name               = "tharunkpk-mum"
  }

  tags = {
    Name = "Web-server"
  }
}