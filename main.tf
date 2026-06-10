# 1. 定义 Provider
terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

# 2. 定义 Databricks Provider
# 注意：HOST 和 TOKEN 请确保已经在 Terraform 的 Variables 中设置过
provider "databricks" {
}

# 3. 定义 Databricks Notebook 资源
resource "databricks_notebook" "my_demo_notebook" {
  # 请将路径中的邮箱替换为你 Databricks 登录的邮箱
  path     = "/Users/your-email@example.com/Demo-Notebook"
  language = "PYTHON"
  
  # 使用 content_base64 解决之前的报错问题
  content_base64 = base64encode("print('Hello Databricks from Terraform!')")
}

# 4. 定义输出
output "notebook_path" {
  value       = databricks_notebook.my_demo_notebook.path
  description = "The path of the created notebook"
}
