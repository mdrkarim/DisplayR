# Key variable for refrencing 
variable "key_name" {
  default = "ec2key"      # if we keep default blank it will ask for a value when we execute terraform apply
}

# Base_path for refrencing 
variable "base_path" {
  default = "/home/mohammed/Documents/displayr/" # Provide your path in your local to save the Key_pair
}
/*
variable "public_key" {
    type = string
}*/