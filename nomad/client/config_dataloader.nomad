data_dir = "/opt/nomad/data"

client {
  enabled = true
  servers = ["nomad_seeder", "nomad_server_a", "nomad_server_b"]
  options = {
    "user.blacklist" = "root"
    "driver.raw_exec.enable" = "1"
  }
  meta {
    "node_type" = "dataloader"
  }
}
