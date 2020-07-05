###############################################################################
# Salt master outputs
###############################################################################

output "salt_master_fip" {
  description = "Salt master fip"
  value = "${module.salt_master.salt_master_fip}"
}

output "salt_master_network" {
  description = "Salt master network"
  value = "${module.salt_master.salt_master_network}"
}

###############################################################################
# Salt minion hosts outputs
###############################################################################
output "salt_minion1_fip" {
  description = "Salt minion1 fip"
  value = "${module.salt_minion1.salt_minion_fip}"
}

output "salt_minion1_network" {
  description = "Salt minion network"
  value = "${module.salt_minion1.salt_minion_network}"
}

output "salt_minion2_fip" {
  description = "Salt minion2 fip"
  value = "${module.salt_minion2.salt_minion_fip}"
}

output "salt_minion2_network" {
  description = "Salt minion network"
  value = "${module.salt_minion2.salt_minion_network}"
}
