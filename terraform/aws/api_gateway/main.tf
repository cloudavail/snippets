provider "aws" {
  region = "us-west-2"
}

resource "aws_api_gateway_rest_api" "test_api" {
  name        = "cloudavail-test"
}

resource "aws_api_gateway_resource" "test_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  parent_id   = aws_api_gateway_rest_api.test_api.root_resource_id
  path_part   = "test"
}

resource "aws_api_gateway_method" "test_resource_get_gateway_method" {
  rest_api_id   = aws_api_gateway_rest_api.test_api.id
  resource_id   = aws_api_gateway_resource.test_gateway_resource.id
  http_method   = "GET"
  authorization = "NONE"
}
