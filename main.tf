# 1. 定义 Provider（告诉 Terraform 我们要操作 AWS）
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # 你可以根据需要修改区域
}

# 2. 定义资源：创建一个 S3 存储桶
resource "aws_s3_bucket" "my_demo_bucket" {
  bucket = "my-unique-terraform-demo-bucket-20260609" # 注意：S3桶名必须全局唯一，请修改为你自己的名字
  
  tags = {
    Name        = "My Terraform Demo Bucket"
    Environment = "Dev"
  }
}

# 3. 定义输出：部署完成后，打印出桶的名称
output "bucket_name" {
  value       = aws_s3_bucket.my_demo_bucket.bucket
  description = "The name of the created S3 bucket"
}
