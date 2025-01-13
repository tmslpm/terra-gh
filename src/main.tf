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

# Step:
# - import `terraform import github_repository.$github_name $repo_name`.
# - edit the resource github_repository
# - run `terraform init` (first time only); `terraform plan` and `terraform apply`.
resource "github_repository" "tmslpm" {
  name             = "terra-gh"
  description      = "test"
  license_template = "mit"
  is_template      = true
  has_wiki         = false
  has_projects     = false
  has_downloads    = false
  has_issues       = true
  has_discussions  = true
  topics           = ["terraform", "github", "cli"]
}
