# 1. 定义两个 Provider 的要求
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

# 2. 定义 AWS Provider (指定区域)
provider "aws" {
  region = "ap-northeast-1" 
}

# 3. 定义 Databricks Provider
provider "databricks" {
  # 这里保持空，确保环境变量 DATABRICKS_HOST 和 TOKEN 已在 Terraform Cloud 设置好
}

# 4. 定义资源：AWS S3 Bucket
resource "aws_s3_bucket" "my_demo_bucket" {
  bucket = "my-unique-test-bucket-2026-06-09-xyz" 
  tags = {
    Name        = "My Terraform Demo Bucket"
    Environment = "Dev"
  }
}

# 5. 定义资源：Databricks Notebook
resource "databricks_notebook" "my_demo_notebook" {
  path     = "/Users/your-email@example.com/Demo-Notebook"
  language = "PYTHON"
  content_base64 = base64encode("print('Hello Databricks from Terraform!')")
}

# 6. 定义输出
output "bucket_name" {
  value       = aws_s3_bucket.my_demo_bucket.bucket
}

output "notebook_path" {
  value       = databricks_notebook.my_demo_notebook.path
}
