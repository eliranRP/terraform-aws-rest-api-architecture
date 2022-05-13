variable "zone_id" {
  description = "The id of the parent Route53 zone to use for the distribution."
  type        = string
  default     = null
}
variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued"
  default     = null
}
variable "acm_request_certificate_arn" {
  description = "Certificate manager ARN"
  type        = string
  default     = null
}
variable "context" {
  type = any
}
variable "path_part" {
  type        = string
  description = "The last path segment of this API resource"
}

variable "integration_input_type" {
  type        = string
  description = "The integration input's type."
}

variable "integration_http_method" {
  type        = string
  default     = "ANY"
  description = "The integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end."
}

variable "elastic_beanstalk_environment_cname" {
  type        = string
  description = "Elastic beanstalk environment name"
}

variable "elastic_beanstalk_application_name" {
  type        = string
  description = "Elastic beanstalk application name"
}

variable "kms_key_arn" {
  type        = string
  description = "The KMS arn key to encrtypt all logs "
}
variable "nlb_arn" {
  type        = string
  description = "Network load balncer arn"
}
variable "access_log_format" {
  description = "The format of the access log file."
  type        = string
  default     = <<EOF
  {
	"requestTime": "$context.requestTime",
	"requestId": "$context.requestId",
	"httpMethod": "$context.httpMethod",
	"path": "$context.path",
	"resourcePath": "$context.resourcePath",
	"status": $context.status,
	"responseLatency": $context.responseLatency,
  "xrayTraceId": "$context.xrayTraceId",
  "integrationRequestId": "$context.integration.requestId",
	"functionResponseStatus": "$context.integration.status",
  "integrationLatency": "$context.integration.latency",
	"integrationServiceStatus": "$context.integration.integrationStatus",
  "authorizeResultStatus": "$context.authorize.status",
	"authorizerServiceStatus": "$context.authorizer.status",
	"authorizerLatency": "$context.authorizer.latency",
	"authorizerRequestId": "$context.authorizer.requestId",
  "ip": "$context.identity.sourceIp",
	"userAgent": "$context.identity.userAgent",
	"principalId": "$context.authorizer.principalId",
	"cognitoUser": "$context.identity.cognitoIdentityId",
  "user": "$context.identity.user"
}
  EOF
}

variable "user_pool_arn" {
  description = "The ARN of the Cognito user pool"
  type        = string
}


variable "cors_domain" {
  description = "List of all cors domain relevant to the api gateway resource, for example if we want to be able to allow request from client `[www.client.com,client.com]` "
  type        = list(string)
}