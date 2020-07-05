###############################################################################
# Common
###############################################################################
variable "external_network_id" {
  description = "OpenStack external network id"
  default = "298117ae-3fa4-4109-9e08-8be5602be5a2" # ext-net
}

variable "keypair" {
  description = "MCS ssh keypair name"
  default = "rsa2048-r-savchenko-mail-ru-0UK6ryRh"
}

variable "ssh_dir" {
  description = "SSH keys dir"
  default = "~/.ssh"
}

variable "ssh_private_key" {
  description = "SSH private key file name"
  default = "rsa2048_r.savchenko_mail.ru"
}

variable "enable" {
  description = "Enable provisioning cloud infrastructure"
  default = 1
}

variable "accept_minion_keys" {
  description = "Accept minion keys (1/0)"
  default = 1
}

variable "ansible_provision_prefix" {
  description = "Ansible provision directory prefix"
  default = "ansible-provision/"
}

variable "salt_repo" {
  description = "Salt state repository"
  default = "https://github.com/sav4enk0r0man/terraform-mcs-salt.git"
}
