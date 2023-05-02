terraform { 
  required_providers { 
    aws = { 
      source = "hashicorp/aws" 
      version = "~> 4.0" 
    }
  } 
} 
 
provider "aws" { 
  region = "us-east-1" 
  shared_credentials_files = ["../credentials"] 
}

resource "aws_ecr_repository" "taskoverflow" { 
 name = "taskoverflow" 
}

resource "local_file" "url" {
    content  = "${aws_ecr_repository.taskoverflow.repository_url}"
    filename = "./ecr.txt"
}
