output "salt_minion_fip" {
  description = "Salt minion instance fip"
  value = "${openstack_networking_floatingip_v2.salt_minion_fip.*.address}"
}

output "salt_minion_network" {
  description = "Salt minion instance network"
  value = "${openstack_compute_instance_v2.salt_minion_instance.*.network}"
}
