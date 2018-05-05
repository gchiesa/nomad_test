#!/usr/bin/env sh
set -e 

if [ "$1" == "seeder" ]; then 
    echo "THIS IS THE SEEDER"
    joiners_args=''
else
    joiners_args='-retry-join=nomad_seeder'
fi

# consul 
/opt/consul/consul agent -server -ui -bootstrap-expect=3 -data-dir=/opt/consul/data $joiners_args & 

# nomad
/opt/nomad/nomad agent -server -config=/opt/nomad/config/config.nomad $joiners_args
