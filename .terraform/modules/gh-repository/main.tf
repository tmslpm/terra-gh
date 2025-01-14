
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
  description          = "Repository managed by Terraform!"
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
  depends_on    = [github_repository_file.subproject_readme]
  for_each      = var.github_repository_subprojects
  repository    = var.github_repository_name
  branch        = "branch-${each.value}"
  source_branch = "main"
}

data "github_branch" "main_branch" {
  repository = var.github_repository_name
  branch     = "main"
}

resource "github_repository_file" "subproject_readme" {
  for_each            = var.github_repository_subprojects
  repository          = var.github_repository_name
  branch              = "main"
  file                = "src/packages/${each.value}/readme.md"
  content             = "# Managed by Terraform"
  commit_message      = "Managed by Terraform - subproject ${each.value}"
  commit_author       = "terraform"
  commit_email        = "noreply@terraform.com"
  overwrite_on_create = false
}
