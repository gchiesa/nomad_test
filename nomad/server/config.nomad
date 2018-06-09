data_dir = "/opt/nomad_data"

server {
  enabled          = true
  bootstrap_expect = 3
}
consul {
  address = "{{ GetInterfaceIP 'eth0' }}:8500"
}