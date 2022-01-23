
# Yet another k8s home lab cluster

1 master, 2 nodes, 1 nfs server

## Documentation

Initially based on [this repo](https://github.com/scriptcamp/vagrant-kubeadm-kubernetes.git)

Also installs helm on master node, [NFS Subdir External Provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)

Pay attention that `storageClassName` for `PersistentVolumeClaim` should be `nfs-client`

Example:

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: test-claim
spec:
  storageClassName: nfs-client
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi
```

## Prerequisites

1. Working Vagrant setup
2. 16 Gig + RAM workstation as the Vms use 6 vCPUS and 6+ GB RAM

## Usage/Examples

To provision the cluster, execute the following commands.

```shell
git clone https://github.com/alvicsam/k8s-vagrant
cd k8s-vagrant
./runme.sh
```

## Check that the cluster works

```shell
vagrant ssh master
vagrant@master-node:~$ k get nodes

NAME            STATUS   ROLES                  AGE   VERSION
master-node     Ready    control-plane,master   14m   v1.20.6
worker-node01   Ready    worker                 12m   v1.20.6
worker-node02   Ready    worker                 10m   v1.20.6
```

## Destroy the cluster

```shell
vagrant destroy -f
```

