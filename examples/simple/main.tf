provider "aws" {
  region = "eu-west-3"
}

module "infrastructure" {
  source = "../../"

  region                       = "eu-west-3"
  availability_zones           = ["eu-west-3a"]
  stage                        = "develop"
  name                         = "terraform-moveohls"
  cognito_default_user_email   = "eliran@moveohls.com"
  client_repository_name       = "terraform-aws-rest-api-architecture"
  client_branch_name           = "main"
  server_repository_name       = "terraform-aws-rest-api-architecture"
  server_branch_name           = "main"
  github_org                   = "MoveoTech"
  private_endpoint_enabled     = true
  enable_atlas_whitelist_ips   = true
  public_key                   = var.public_key
  private_key                  = var.private_key
  atlas_org_id                 = var.atlas_org_id
  provider_instance_size_name  = "M10"
  extended_ec2_policy_document = data.aws_iam_policy_document.service.json
  cognito_enabled              = true
  codebuild_server_env_vars = [{
    name  = "ENV1"
    value = "this is my value"
    type  = "PLAINTEXT"
    },

    {
      name  = "ENV2"
      value = "this is my second value"
      type  = "PLAINTEXT"
    }
  ]
  codebuild_client_env_vars = [{
    name  = "ENV1"
    value = "this is my value"
    type  = "PLAINTEXT"
    },

    {
      name  = "ENV2"
      value = "this is my second value"
      type  = "PLAINTEXT"
    }
  ]
}

data "aws_iam_policy_document" "service" {
  statement {
    sid = "AllowSSMOperationsOnElasticBeanstalkBuckets1"
    actions = [
      "secretsmanager:GetResourcePolicy"
    ]
    resources = ["*"]
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}



# module "secure_baseline" {
#   source = "./security_baseline"

#   region               = var.region
#   audit_s3_bucket_name = var.name
#   context              = module.this.context

# }

resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = module.infrastructure.atlas_project_id
  ip_address = "93.157.85.78"
  comment    = "Example ip address for accessing the cluster"
}
