data_dir = "/opt/nomad/data"

consul {
  address = "nomad_seeder:8500"
  auto_advertise = false
}

client {
  enabled = true
  servers = ["nomad_seeder", "nomad_server_a", "nomad_server_b"]
  options = {
    // "user.blacklist" = "root"
    "driver.raw_exec.enable" = "1"
  }
  meta {
    "node_type" = "dataloader"
  }
}
