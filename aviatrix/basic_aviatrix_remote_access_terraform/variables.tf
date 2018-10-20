  # from https://aws.amazon.com/marketplace/server/configuration?productId=0c922525-51c4-4b64-94ec-744291c05c1c&ref_=psb_cfg_continue
variable "aviatrix_amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-df74f6a0"
    "us-east-2" = "ami-a72c11c2"
    "us-west-1" = "ami-e3170983"
    "us-west-2" = "ami-1f770667"
  }
}
