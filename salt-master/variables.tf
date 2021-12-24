variable "hostname" {
  description = "Name of Salt master host"
  default = "localhost"
}

variable "salt_master_keypair" {
  description = "MCS ssh keypair name"
  default = ""
}

variable "ssh_dir" {
  description = "SSH keys dir"
  default = "~/.ssh"
}

variable "ssh_private_key" {
  description = "SSH private key file name"
  default = "id_rsa"
}

variable "ssh_user" {
  description = "SSH username"
  default = "centos"
}

variable "salt_master_volume_type" {
  description = "Host volume type (ceph/ssd)"
  default = "ssd"
}

variable "salt_master_volume_size" {
  description = "Default host volume size"
  default = 20
}

variable "fip_network" {
  description = "Floating ip pool name"
  default = "ext-net"
}

variable "salt_master_flavor_id" {
  description = "Host flavor id"
  default = "908479b5-1138-46b6-b746-48bf6c24e548" # Standard-4-8-80
}

variable "salt_master_image_id" {
  description = "Host image id"
  default = "b228329c-869b-4778-a2db-7bbe5412bd14" # CentOS-7.6-201903
}

variable "network_id" {
  description = "Private network for Salt master hosts"
  default = ""
}

variable "subnet_id" {
  description = "Subnet of Salt master hosts"
  default = ""
}

variable "salt_minion_addresess" {
  description = "Salt minion addresses list"
  default = []
}

variable "provision_commands" {
  description = "Commands run during provisioning"
  default = [
    "uptime" # dummy command
  ]
}

variable "salt_master_enable" {
  description = "Enable create Salt master host"
  default = 0
}

variable "ansible_provision_prefix" {
  description = "Ansible provision directory prefix"
  default = ""
}

variable "accept_minion_keys" {
  description = "Accept minion keys (1/0)"
  default = 0
}

variable "ansible_verbose" {
  description = "Ansible verbose level"
  default = "-v"
}
