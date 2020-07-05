terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket   = "mcs-salt-example"
    key      = "terraform.tfstate"
    endpoint = "https://hb.bizmrg.com"
    region   = "RegionOne"

    skip_requesting_account_id = true
    skip_credentials_validation = true
    skip_get_ec2_platforms = true
    skip_metadata_api_check = true
    skip_region_validation = true

    shared_credentials_file = ".aws/credentials-terraform"
  }
}

provider "openstack" {
  # Use local openrc credentials
}

# Salt private network
resource "openstack_networking_network_v2" "salt_network" {
  name           = "salt_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "salt_subnet" {
  name       = "salt_subnet"
  network_id = openstack_networking_network_v2.salt_network.id
  cidr       = "10.1.11.0/24"
  ip_version = 4
}

# OpenStack virtual router for Salt network
resource "openstack_networking_router_v2" "salt_router" {
  name                = "salt_router"
  admin_state_up      = true
  external_network_id = var.external_network_id
}

# Add network interface to Salt network
resource "openstack_networking_router_interface_v2" "salt_router_interface" {
  router_id = openstack_networking_router_v2.salt_router.id
  subnet_id = openstack_networking_subnet_v2.salt_subnet.id
}

# Provisioning Salt minion host
module "salt_minion1" {
  source                 = "./salt-minion"

  hostname               = "salt-minion1"
  network_id             = "${openstack_networking_network_v2.salt_network.id}"
  subnet_id              = "${openstack_networking_subnet_v2.salt_subnet.id}"
  salt_minion_keypair    = "${var.keypair}"
  ssh_dir                = "${var.ssh_dir}"
  ssh_private_key        = "${var.ssh_private_key}"
  salt_minion_enable     = "${var.enable}"
}

# Provisioning Salt minion host
module "salt_minion2" {
  source                 = "./salt-minion"

  hostname               = "salt-minion2"
  network_id             = "${openstack_networking_network_v2.salt_network.id}"
  subnet_id              = "${openstack_networking_subnet_v2.salt_subnet.id}"
  salt_minion_keypair    = "${var.keypair}"
  ssh_dir                = "${var.ssh_dir}"
  ssh_private_key        = "${var.ssh_private_key}"
  salt_minion_enable     = "${var.enable}"
}

# Provisioning Salt master host
module "salt_master" {
  source                 = "./salt-master"

  hostname               = "salt-master"
  network_id             = "${openstack_networking_network_v2.salt_network.id}"
  subnet_id              = "${openstack_networking_subnet_v2.salt_subnet.id}"
  salt_master_keypair    = "${var.keypair}"
  ssh_dir                = "${var.ssh_dir}"
  ssh_private_key        = "${var.ssh_private_key}"
  salt_master_enable     = "${var.enable}"
}
