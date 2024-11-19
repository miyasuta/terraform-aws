variable "db_username" {
    description = "The userame for the database"
    type = string
    sensitive = true
}

variable "db_password" {
  description = "The password for the database"
  type = string
  sensitive = true
}

variable "db_identifier_prefix" {
  description = "identifier prefix"
  type = string  
}

variable "db_name" {
  default = "db name"
  type = string
}