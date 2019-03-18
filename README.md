# randocat-infra-as-code

# Install

TBD

# Build, Deploy, and Test

    AWS_PROFILE=myprofile make

# next level: Terraform

## setup
    cd terraform
    AWS_PROFILE=myprofile make init

## check plan

    AWS_PROFILE=myprofile make plan

## apply planned changes

    AWS_PROFILE=myprofile make apply


# TODO

- switch to multiple, limited IAM users
 
# Resources

* https://serverless.com/blog/serverless-python-packaging/


# Troubleshooting

Q: InvalidParameterCombination: The DB instance and EC2 security group are in different VPCs

A: https://github.com/terraform-providers/terraform-provider-aws/issues/3060#issuecomment-448565596
