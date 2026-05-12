terraform {
  required_version = ">= 1.5.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  type    = string
  default = "demo"
}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "summary" {
  filename = "${path.module}/demo-output.txt"
  content  = <<EOT
environment = ${var.environment}
generated_name = ${random_pet.name.id}
EOT
}

output "environment" {
  value = var.environment
}

output "generated_name" {
  value = random_pet.name.id
}

output "file_path" {
  value = local_file.summary.filename
}
