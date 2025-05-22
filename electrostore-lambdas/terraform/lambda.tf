resource "aws_lambda_function" "user_register" {
  function_name = "user_register"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = var.user_register_handler           # Ej: register.handler
  runtime       = var.lambda_runtime                  # Ej: nodejs22.x
  filename      = var.user_register_zip               # Ruta local: ../user/register.zip
  source_code_hash = filebase64sha256(var.user_register_zip)

  environment {
    variables = {
      USERS_TABLE = aws_dynamodb_table.user_table.name
    }
  }

  depends_on = [aws_cloudwatch_log_group.user_register_log]
}
