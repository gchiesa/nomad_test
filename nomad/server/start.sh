#!/usr/bin/env sh
set -e 

if [ "$1" == "seeder" ]; then 
    echo "THIS IS THE SEEDER"
    joiners_args=''
else
    joiners_args='-retry-join=nomad_seeder'
fi

# consul 
su --login -c "export CONSUL_UI_BETA=true && /opt/consul/consul agent -log-level=debug -server -ui -bootstrap-expect=3 -data-dir=/opt/consul/data -client '{{ GetInterfaceIP \"eth0\" }}' $joiners_args &" hashicorp

# nomad
su --login -c "/opt/nomad/nomad agent -server -config=/opt/nomad/config/config.nomad $joiners_args" hashicorp

