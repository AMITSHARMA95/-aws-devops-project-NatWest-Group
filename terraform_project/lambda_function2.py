resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_function.lambda_handler"
  
  # Reference the path to the new ZIP file
  filename      = "lambda_function_payload.zip"
  
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
}

