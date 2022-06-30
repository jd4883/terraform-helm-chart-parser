variable "charts" { type = any }

variable "default_extras" {
  default = {}
  type    = map(any)
}

variable "extras_injection_condition" {
  default = []
  type    = list(string)
}

variable "extras_payload" {
  default = {}
  type    = any
}

variable "image_default" {
  type = object({
    pullPolicy = string
    registry   = string
    tag        = string
  })
  default = {
    pullPolicy = "Always"
    registry   = "dockerhub"
    tag        = "latest"
  }
}
