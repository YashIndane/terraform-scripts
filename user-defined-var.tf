variable "x"{

  type = string
  default = "hello world"

}

output "myvalue"{

  value = "hey, ${var.x}"

}
