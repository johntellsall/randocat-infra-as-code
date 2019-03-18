# output "vpc_securityGroupIds" {
#   value = "value"
# }

# output "vpc_subnetIds" {
#   value = "${data.aws_security_groups.mydb.id}"
# }



output "db_host" {
  value = "${aws_db_instance.mydb.address}"
}

output "postgres_user" {
  value = "${aws_db_instance.mydb.username}"
}
output "postgres_dbname" {
  value = "${aws_db_instance.mydb.name}"
}
