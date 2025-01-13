variable "my_variable" {
  description = "Description to document the purpose of the variable and what value is expected"
  type        = string
  nullable    = false
  sensitive   = false
  default     = "Hello World!"
  validation {
    condition     = length(var.my_variable) > 0
    error_message = "variable terraform \"my_variable\" cannot be empty"
  }
}
