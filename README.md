# vagrant-minikube

## Run `minikube` with `Ubuntu 20.04` and `docker` on `VirtualBox` with `vagrant` 

### Requirements

It is OS independent: Linux/Windows/MacOS are feasible. The following software should be installed on your workstation

* `virtualbox`
* `vagrant`
* `git`

### VM deployment

Run the following commands in `terminal` application of your choice

* `git clone https://github.com/cloud-simple/vagrant-minikube.git`
* `cd agrant-minikube`
* `vagrant up`

### Kubernetes launch

Access you VM OS with SSH and start `minikube`

* `vagrant ssh`
* `minikube start`

Check the status of your Kubernetes cluster

```shell
$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

$ kubectl get nodes
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   4h46m   v1.26.1
```
