# Región AWS
variable "aws_region" {
  description = "Región de AWS"
  default     = "us-west-1"
}

# =======================
# LAMBDA - USUARIOS
# =======================
variable "user_lambda_name" {
  default = "user-service-lambda"
}

variable "user_lambda_zip" {
  default = "../user/user.zip" # Ruta al ZIP que tendrá tu Lambda de usuario
}

variable "user_lambda_handler" {
  default = "index.handler" # index.js y función exportada "handler"
}

variable "user_api_path" {
  default = "usuarios/{proxy+}"
}

# =======================
# API Gateway Stage
# =======================
variable "api_env_stage_name" {
  default = "dev"
}

# =======================
# Runtime para Lambdas (Node.js 22)
# =======================
variable "lambda_runtime" {
  default = "nodejs22.x"
}

# Puedes agregar más si vas a tener lambdas separadas por acción:
variable "user_register_handler" {
  default = "index.handler"
}



variable "user_register_zip" {
  default = "../user/register.zip"
}

