provider "aws" {
  region = "us-east-1"
}

terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "terraform-week-inyongwoo327"
    key            = "terraform.tfstate"
    region         = "us-east-1"
   dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "db_pass_1" {
  description = "password for database #1"
  type        = string
  sensitive   = true
}

variable "db_pass_2" {
  description = "password for database #2"
  type        = string
  sensitive   = true
}

variable "app-name-1" {
    description = "Name of the web app"
    type = string
}

variable "app-name-2" {
    description = "Name of the web app"
    type = string
}

module "web_app_1" {
  source = "../vpc-set-up-modules"
  # Input Variables
  #bucket = "terraform-week-inyongwoo327"
  domain = "evanwoo.com"
  app-name         = var.app-name-1
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp1db"
  db_user          = "foo"
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "../vpc-set-up-modules"
  # Input Variables
  #bucket_prefix    = "web-app-2-data"
  domain           = "evanwoo.com"
  app-name         = var.app-name-2
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = true
  db_name          = "webapp2db"
  db_user          = "bar"
  db_pass          = var.db_pass_2
}
