provider "ibm" {
}

variable "public_ssh_key" {
  description = "Public SSH key used to connect to the virtual guest"
}

variable "datacenter" {
  description = "Softlayer datacenter where infrastructure resources will be deployed"
}


variable "hostname" {
  description = "Hostname of the virtual instance (small flavor) to be deployed"
  default = "debian-small"
}

# This will create a new SSH key that will show up under the \
# Devices>Manage>SSH Keys in the SoftLayer console.
resource "ibm_compute_ssh_key" "orpheus_public_key" {
    label = "Orpheus Public Key"
    public_key = "${var.public_ssh_key}"
}

# Create a new virtual guest using image "Debian"
resource "ibm_compute_vm_instance" "debian_small_virtual_guest" {
    hostname = "${var.hostname}"
    os_reference_code = "UBUNTU_LATEST_64"
    domain = "cam.ibm.com"
    datacenter = "${var.datacenter}"
    network_speed = 10
    hourly_billing = true
    private_network_only = false
    cores = 1
    memory = 2048
    disks = [25, 10, 20]
    user_metadata = "{\"value\":\"newvalue\"}"
    dedicated_acct_host_only = false
    local_disk = false
    ssh_key_ids = ["${ibm_compute_ssh_key.orpheus_public_key.id}"]
    count = 1
}

