variable "alb_name" {
    type = string
}

variable "public_subnets" {
    type = list(string)
}

variable "alb_sg_name" {
    type = string
}

variable "alb_sg_description" {
    type = string
}

variable "core_network" {
    type = string
}

variable "alb_sg" {
  type = map(string)
}

variable "alb_tg_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "alb_egress" {
  type = map(object({
    description = string
    cidr_block = list(string)
    protocol = string
    port = number
  }))
}