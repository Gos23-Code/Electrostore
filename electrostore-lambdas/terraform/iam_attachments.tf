# ============= ATTACH POLICIES A ROLE BASE =============
resource "aws_iam_role_policy_attachment" "user_lambda_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.user_lambda_policy.arn
}

# ============= PERMISOS PARA LOGS DE CLOUDWATCH (RECOMENDADO) =============
resource "aws_iam_role_policy_attachment" "cloudwatch_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
