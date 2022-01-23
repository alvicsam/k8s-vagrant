#!/bin/bash

vagrant up --no-provision nfs
vagrant up --no-provision master
vagrant up --no-provision node01
vagrant up --no-provision node02
# vagrant vbguest
# vagrant up --no-provision
echo "Provisioning NFS server"
vagrant provision nfs > nfs.log
echo "Provisioning k8s master server"
vagrant provision master > master.log
echo "Provisioning k8s node01 server"
vagrant provision node01 > node01.log
echo "Provisioning k8s node02 server"
vagrant provision node02 > node02.log
