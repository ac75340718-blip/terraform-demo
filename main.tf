# 1. 定义 Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. 定义 Provider (统一使用东京区域)
provider "aws" {
  region = "ap-northeast-1" 
}

# 3. 定义资源 (仅保留一个)
resource "aws_s3_bucket" "my_demo_bucket" {
  # 请确保这个名字在全世界范围内没有被别人占用
  bucket = "my-unique-test-bucket-2026-06-09-xyz" 
  
  tags = {
    Name        = "My Terraform Demo Bucket"
    Environment = "Dev"
  }
}

# 4. 定义输出
output "bucket_name" {
  value       = aws_s3_bucket.my_demo_bucket.bucket
  description = "The name of the created S3 bucket"
}
