# external module can be found here: https://registry.terraform.io/

# - terraform workspace show
# - terraform workspace list
# - terraform workspace new $name
locals {
  env = terraform.workspace
  example = {
    default = "hello-default"
    prod    = "hello-prod"
    dev     = "hello-dev"
  }
}

module "hello-world" {
  source      = "./modules/hello-world"
  my_variable = lookup(local.example, local.env)
}

module "gh-repository" {
  source = "./modules/gh-repository"
  # config
  github_token                  = var.github_token
  github_repository_subprojects = ["foo", "bar"]
  github_repository_name        = "terra-gh"
  github_owner                  = "tmslpm"
}
