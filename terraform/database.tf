# database.tf

data "aws_vpc" "default" {
  default = true
}

# data "aws_subnet_ids" "all" {
#   vpc_id = "${data.aws_vpc.default.id}"
# }

# data "aws_security_group" "default" {
#   vpc_id = "${data.aws_vpc.default.id}"
#   name   = "default"
# }

# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
# #   storage_type         = "gp2"
#   engine               = "postgresql"
# #   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   name                 = "mydb"
#   username             = "foo"
#   password             = "foobarbaz"
# #   parameter_group_name = "default.mysql5.7"
# }

# resource "aws_rds_cluster" "postgresql" {
#   cluster_identifier      = "mar16-aurora-cluster"
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