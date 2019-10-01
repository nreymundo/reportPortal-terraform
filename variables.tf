variable "vpc_id" {
    default = ""
}
variable "trusted_cidrs" {
    default = ""
}
variable "subnet" {
    default = ""
}
variable "zone_id" {
    default = ""
}
variable "instance_type" {
  default = "t2.xlarge"
}
variable "name" {
  default = "reportportal"
}
variable "owner" {
  default = "Nicolas Reymundo"
}
variable "repo" {
  default = ""
}
variable "purpose" {
  default = "test results aggregation tool"
}
variable "ssh_public_key_name" {
    default = ""
}
variable "ssh_private_key_path" {
    default = ""
}
variable "ssh_port" {
  default = 22
}
variable "ssh_user" {
  default = "ec2-user"
}
