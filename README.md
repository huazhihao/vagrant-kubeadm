# vagrant box of for kubeadm

This vagrant box includes all the prerequisite components and images for the setup of kubernetes cluster with `kubeadm`.

# Create a cluster

```sh
vagrant init huazhihao/kubeadm
vagrant up

vagrant ssh

sudo kubeadm init --pod-network-cidr ${POD_CIDR} --apiserver-advertise-address 10.8.8.10

sudo mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

kubectl cluster-info
```

# Join a cluster

Under the master node of cluster to be joined

```sh
kubeadm token create --print-join-command
```

Under worker node, execute the output command copied from above.

