variable "resource-group" {
  type = string
  description = "resource group name"
  default = "api-db-testing"
}

variable "location" {
  type = string
  default = "Central US"
}

variable "project" {
  type = string
  default = "api"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "tags" {
  type = map(string)
  default = {
    "createdBy": "Carlos Flores"
  }
}

variable "subscription_id" {
  type = string
}

variable "admin_sql_password" {
  type = string
}
