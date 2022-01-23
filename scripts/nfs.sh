#! /bin/bash

sudo apt-get update

sudo apt install -y nfs-kernel-server

sudo mkdir -p /mnt/nfs_share
sudo chown -R nobody:nogroup /mnt/nfs_share/
sudo chmod 777 /mnt/nfs_share/
sudo touch /etc/exports
sudo echo "/mnt/nfs_share  10.0.0.0/24(rw,sync,no_subtree_check)" >> /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
