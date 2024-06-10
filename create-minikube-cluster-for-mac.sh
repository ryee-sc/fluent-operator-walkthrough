brew install minikube

brew install kubectl

brew install hyperkit

minikube start --force --driver=hyperkit --cpus=4
kubectl config use-context minikube

