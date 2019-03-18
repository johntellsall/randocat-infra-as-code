all:

init:
	terraform init

plan:
	terraform plan -out=current.plan

apply:
	terraform apply current.plan


# ---

output:
	terraform refresh
	terraform output