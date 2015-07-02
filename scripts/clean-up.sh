#!/bin/bash
set -x

#############################################
# Functions
#############################################

clean_puppet() {
  find /var/lib/puppet/ssl -type f -exec rm -f {} \;
  rm -f /etc/puppet/puppet.conf
}

clean_logs() {
  find /var/log -type f -exec rm -f {} \;
}

clean_network() {
  sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0
  echo -n > /etc/udev/rules.d/70-persistent-net.rules
  echo -n > /lib/udev/rules.d/75-persistent-net-generator.rules
}

clean_cloudinit () {
  rm -rf /var/lib/cloud/*
}

clean_consul () {
  rm -f /opt/consul/serf/*
  rm -f /opt/consul/checkpoint-signature
  rm -f /etc/consul/*.json
}

#############################################
# Main
#############################################
clean_puppet
clean_logs
clean_network
clean_cloudinit
clean_consul

date +%F_%H-%M-%S > /TEMPLATE_DATE
