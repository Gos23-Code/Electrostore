resource "aws_cloudwatch_log_group" "user_register_log" {
  name              = "/aws/lambda/user_register"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "user_login_log" {
  name              = "/aws/lambda/user_login"
  retention_in_days = 14
}
