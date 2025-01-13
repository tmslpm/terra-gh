terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type = string
}

variable "subprojects" {
  type    = set(string)
  default = ["foo", "bar"]
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

# import `terraform import github_repository.$github_name $repo_name`
resource "github_repository" "tmslpm" {
  name        = "terra-gh"
  description = "test" 
}
