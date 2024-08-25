variable "region" {
    description = "Default region for provider"
    type = string
    default = "us-east-1"
}

variable "app-name" {
    description = "Name of the web app"
    type = string
    default = "web-app"
}

variable "environment_name" {
    description = "Deployment environment (dev/staging/production)"
    type = string
    default = "dev"
}

/*
variable "ami" {
    description = "AMI to use for ec2 instance"
}

variable "bucket_prefix" {
    description = "prefix of s3 bucket for app data"
    type        = string
}
*/

variable "instance_type" {
    description = "ec2 instance type"
    type        = string
    default     = "t2.micro"
}

variable "create_dns_zone" {
    description = "If true, create new route53 zone, if false read existing route53 zone"
    type        = bool
    default     = false
}

variable "domain" {
    description = "Domain for website"
    type = string
    default = "evanwoo.com"
}

variable "db_name" {
    description = "Name of DB"
    type = string
}

variable "db_user" {
    description = "Username for DB"
    type = string
}

variable "db_pass" {
    description = "Password for DB"
    type = string
    sensitive = true

    validation {
      condition = length(var.db_pass) >= 8
      error_message = "The database password must be at least 8 characters long."
    }
}
