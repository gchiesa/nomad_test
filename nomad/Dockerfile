FROM centos:7

RUN yum install -y unzip net-tools iproute 
WORKDIR /tmp
#RUN curl https://releases.hashicorp.com/nomad/0.8.3/nomad_0.8.3_linux_amd64.zip -O
RUN curl https://releases.hashicorp.com/nomad/0.8.1/nomad_0.8.1_linux_amd64.zip -O
RUN curl https://releases.hashicorp.com/consul/1.1.0/consul_1.1.0_linux_amd64.zip -O

RUN mkdir -p /opt/nomad_data
RUN mkdir -p /opt/nomad/config
COPY server/config.nomad /opt/nomad/config/config.nomad 

RUN mkdir -p /opt/consul_data
RUN mkdir -p /opt/consul/config

WORKDIR /opt/nomad
RUN unzip /tmp/nomad_*.zip
WORKDIR /opt/consul
RUN unzip /tmp/consul_*.zip

COPY server/start.sh /start.sh
RUN chmod a+x /start.sh

RUN adduser jcomponent
RUN chown -R jcomponent. /opt/consul /opt/nomad /opt/nomad_data /opt/consul_data

ENTRYPOINT ["/start.sh"]
