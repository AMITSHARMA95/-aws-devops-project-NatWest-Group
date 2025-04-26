# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy Attachment
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda Function 1 (First Lambda function)
resource "aws_lambda_function" "s3_event_logger_1" {
  function_name = "s3EventLogger"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = "lambda_function_payload.zip"

  environment {
    variables = {
      ENV_VAR = "value"
    }
  }
}

# Lambda Function 2 (Second Lambda function)
resource "aws_lambda_function" "s3_event_logger_2" {
  function_name = "s3_event_logger"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function2.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda_function_payload.zip"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  environment {
    variables = {
      ENV_VAR = "value"
    }
  }
}

