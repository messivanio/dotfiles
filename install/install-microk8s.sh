sudo snap install microk8s --classic
microk8s.status --wait-ready
microk8s.kubectl config view --raw > $HOME/.kube/microk8s-config