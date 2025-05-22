# ============= POLICY: USER LAMBDA =============
resource "aws_iam_policy" "user_lambda_policy" {
  name        = "user-lambda-dynamodb-policy"
  description = "Permite registrar y loguear usuarios usando DynamoDB y escribir logs en CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:PutItem"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:dynamodb:${var.aws_region}:*:table/User"
      },
      {
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Scan"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:dynamodb:${var.aws_region}:*:table/User"
      },
      {
        Effect: "Allow",
        Action: [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource: "*"
      }
    ]
  })
}
