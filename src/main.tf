terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
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
  name             = var.github_repository_name
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

resource "github_branch" "development" {
  repository = var.github_repository_name
  branch     = "branch-test"
  
}
