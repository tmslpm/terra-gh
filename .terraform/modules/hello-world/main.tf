terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo '${var.my_variable}' "
  }
}
