module "hello-world" {
  source = "./modules/hello-world"
}

module "gh-repository" {
  source                        = "./modules/gh-repository"
  github_owner                  = var.github_owner
  github_repository_name        = var.github_repository_name
  github_repository_subprojects = var.github_repository_subprojects
  github_token                  = var.github_token
}
