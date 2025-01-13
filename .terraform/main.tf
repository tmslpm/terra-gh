module "hello-world" {
  source = "./modules/hello-world"
}

module "gh-repository" {
  source = "./modules/gh-repository"
  # config
  github_token                  = var.github_token
  github_repository_subprojects = ["foo", "bar"]
  github_repository_name        = "terra-gh"
  github_owner                  = "tmslpm"
}
