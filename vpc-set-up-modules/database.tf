resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  auto_minor_version_upgrade = true
  storage_type = "standard"
  engine = "postgres"
  engine_version = "12"
  instance_class = "db.t3.micro"
  name = "mydb"
  username = "foo"
  password = "foobarbaz"
  skip_final_snapshot = true
}