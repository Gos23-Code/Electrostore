resource "aws_apigatewayv2_api" "user_api" {
  name          = "user-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "user_integration" {
  api_id                 = aws_apigatewayv2_api.user_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.user_register.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "user_route" {
  api_id    = aws_apigatewayv2_api.user_api.id
  route_key = "POST /user"
  target    = "integrations/${aws_apigatewayv2_integration.user_integration.id}"
}

resource "aws_apigatewayv2_stage" "prod" {
  api_id      = aws_apigatewayv2_api.user_api.id
  name        = "prod"
  auto_deploy = true
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.user_register.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.user_api.execution_arn}/*/*"
}

output "api_url" {
  value = "https://${aws_apigatewayv2_api.user_api.api_endpoint}/${aws_apigatewayv2_stage.prod.name}"
}
