
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
  description          = "Repository managed by Terraform"
  topics               = ["terraform", "github", "cli"]
  license_template     = "mit"
  is_template          = true
  has_wiki             = false
  has_projects         = false
  has_downloads        = false
  has_issues           = true
  has_discussions      = true
  vulnerability_alerts = true

  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

resource "github_repository_dependabot_security_updates" "tmslpm" {
  repository = var.github_repository_name
  enabled    = true
}

resource "github_branch" "subproject_branches" {
  for_each   = var.github_repository_subprojects
  repository = var.github_repository_name
  branch     = "branch-${each.value}"
  # The commit hash to start from
  source_sha = "169e3df2abb8fdba926ec58785b769459461c32c"
}

resource "github_repository_file" "test-file" {
  repository          = var.github_repository_name
  branch              = "main"
  file                = ".terraform/out/test.md"
  content             = "hello"
  commit_message      = "Managed by Terraform"
  commit_author       = "terraform"
  commit_email        = "noreply@terraform.com"
  overwrite_on_create = true
}
