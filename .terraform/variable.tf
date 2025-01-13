#################################################################
#
# Variable Order:
#   1. env
#   2. terraform.tfvars
#   3. terraform.tfvars.json
#   4. *.auto.tfvars || *.auto.tfvars.json
#   5. cli 
#
#################################################################

variable "github_token" {
  description = "GitHub Personal Access Token used for authenticating the API requests. This token should have sufficient permissions to interact with the repositories."
}
