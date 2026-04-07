variable "vpc_name" {
  type = map(string)
}

variable "cidr_block" {
  type = string
}

variable "pub_name" {
  type = string
}

variable "pub_count" {
  type = number
} 

variable "pub_cidr_block" {
  type = list(string)
}


variable "ig" {
    type = map(string)
}

variable "pub_rt" {
  type = map(string)
}


variable "pri_name" {
  type = string
}

variable "pri_count" {
  type = number
}

variable "pri_cidr_block" {
  type = list(string)
}

variable "pri_rt" {
  type = map(string)
}
