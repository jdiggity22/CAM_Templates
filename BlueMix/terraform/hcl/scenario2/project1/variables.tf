#####################################################################
##
##      Created 4/18/18 by ucdpadmin. for project1
##
#####################################################################

variable "ibm_bmx_api_key" {
  type = "string"
  description = "Generated"
}

variable "ibm_sl_username" {
  type = "string"
  description = "Generated"
}

variable "ibm_sl_api_key" {
  type = "string"
  description = "Generated"
}

variable "vm_instance_domain" {
  type = "string"
  description = "The domain for the computing instance."
}

variable "vm_instance_hostname" {
  type = "string"
  description = "The hostname for the computing instance."
}

variable "vm_instance_datacenter" {
  type = "string"
  description = "The datacenter in which you want to provision the instance. NOTE: If dedicated_host_name or dedicated_host_id is provided then the datacenter should be same as the dedicated host datacenter."
}

variable "vm_instance_os_reference_code" {
  type = "string"
  description = "Generated"
}

