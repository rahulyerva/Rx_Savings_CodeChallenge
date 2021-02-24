variable "fixed_response_content_type" {
  default     = "text/plain"
  type        = string
  description = "The content type. Valid values are text/plain, text/css, text/html, application/javascript and application/json."
}

variable "fixed_response_message_body" {
  default     = "404 Not Found"
  type        = string
  description = "The message body."
}

variable "fixed_response_status_code" {
  default     = "404"
  type        = string
  description = "The HTTP response code. Valid values are 2XX, 4XX, or 5XX."
}