# 1. 定义 Provider
terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

# 2. 定义 Databricks Provider
provider "databricks" {
  # 如果你在 Databricks Workspace 内部通过 Token 运行，
  # 这些 host 和 token 可以留空，会自动获取
  # 如果在外部运行，需要填入 host 和 token
}

# 3. 定义一个示例资源 (例如创建一个 Notebook)
resource "databricks_notebook" "my_demo_notebook" {
  path     = "/Users/your-email@example.com/Demo-Notebook"
  language = "PYTHON"
  content  = base64encode("print('Hello Databricks from Terraform!')")
}

# 4. 定义输出
output "notebook_path" {
  value       = databricks_notebook.my_demo_notebook.path
  description = "The path of the created notebook"
}
