#!/bin/bash
  
echo "Deployment Start time: `date`";
## Deployment Command
time openstack overcloud deploy \
--timeout 480 \
--templates /usr/share/openstack-tripleo-heat-templates \
--stack overcloud \
--libvirt-type kvm \
--ntp-server clock1.rdu2.redhat.com \
-e /home/stack/virt/config_lvm.yaml \
-e /home/stack/virt/network/network-environment.yaml \
-e /home/stack/virt/hostnames.yml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-ha.yaml \
-e /home/stack/virt/debug.yaml \
-e /home/stack/virt/nodes_data.yaml \
-e ~/containers-prepare-parameter.yaml \
--dry-run
#--log-file overcloud_deployment_80.log

echo "Deployment End time: `date`";
