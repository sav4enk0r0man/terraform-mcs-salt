output "salt_master_fip" {
  description = "Salt master instance fip"
  value = "${openstack_networking_floatingip_v2.salt_master_fip.*.address}"
}

output "salt_master_network" {
  description = "Salt master instance network"
  value = "${openstack_compute_instance_v2.salt_master_instance.*.network}"
}
