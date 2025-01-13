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
  name                 = var.github_repository_name
  description          = "test"
  topics               = ["terraform", "github", "cli"]
  license_template     = "mit"
  is_template          = true
  has_wiki             = false
  has_projects         = false
  has_downloads        = false
  has_issues           = true
  has_discussions      = true
  vulnerability_alerts = true
}

resource "github_branch" "subproject_branches" {
  for_each   = var.github_repository_subprojects
  repository = var.github_repository_name
  branch     = "branch-${each.value}"
  # The commit hash to start from
  source_sha = "169e3df2abb8fdba926ec58785b769459461c32c"
}
