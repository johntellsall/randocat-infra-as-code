# database.tf

resource "aws_db_subnet_group" "mydb" {
  name       = "mydb"
  subnet_ids = ["subnet-036e98e254d9d82dd", "subnet-045afd8c823675165"] # TODO make portable

}
resource "aws_db_instance" "mydb" {
  # RDS instance ID
  identifier = "mar17"
  # create database inside instance
  name                 = "mydb"

  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "10.6"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"

# network:
  db_subnet_group_name = "${aws_db_subnet_group.mydb.id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"] # TODO make portable

# security:
# kms_key_id

# fast feedback, but disruptive:
  apply_immediately = "true"
  deletion_protection = "false"
}


# resource "aws_db_subnet_group" "mar17" {
#   name        = "mar17"
#   description = "Our main group of subnets"
#   subnet_ids  = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
# }

# resource "aws_rds_cluster" "postgresql" {
#   cluster_identifier      = "mar17-aurora-cluster"
#   engine                  = "aurora-postgresql"
#   availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
#   database_name           = "mydb"
#   master_username         = "foo"
#   master_password         = "bar"
#   backup_retention_period = 5
#   preferred_backup_window = "07:00-09:00"
# }



# module "db" {
#   source = "../../"

#   identifier = "demodb"

#   engine            = "postgres"
#   engine_version    = "9.6.3"
#   instance_class    = "db.t2.large"
#   allocated_storage = 5
#   storage_encrypted = false

#   # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
#   name = "demodb"

#   # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
#   # "Error creating DB Instance: InvalidParameterValue: MasterUsername
#   # user cannot be used as it is a reserved word used by the engine"
#   username = "demouser"

#   password = "YourPwdShouldBeLongAndSecure!"
#   port     = "5432"

#   vpc_security_group_ids = ["${data.aws_security_group.default.id}"]

#   maintenance_window = "Mon:00:00-Mon:03:00"
#   backup_window      = "03:00-06:00"

#   # disable backups to create DB faster
#   backup_retention_period = 0

#   tags = {
#     Owner       = "user"
#     Environment = "dev"
#   }

#   # DB subnet group
#   subnet_ids = ["${data.aws_subnet_ids.all.ids}"]

#   # DB parameter group
#   family = "postgres9.6"

#   # DB option group
#   major_engine_version = "9.6"

#   # Snapshot name upon DB deletion
#   final_snapshot_identifier = "demodb"

#   # Database Deletion Protection
#   deletion_protection = true
# }