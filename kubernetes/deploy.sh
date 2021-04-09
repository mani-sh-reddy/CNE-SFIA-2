#!/bin/bash

export KUBECONFIG=~/.kube/config

kubectl apply -f namespace.yaml
kubectl config set-context --current --namespace=cneNamespace
kubectl apply -f nginx_config.yaml
kubectl apply

# best way to restart pods - application will not go down is to do a rollout restart
kubectl rollout restart deployment/frontend
kubectl rollout restart deployment/backend


kubectl apply -f nginx_conf.yaml -f nginx_deployment.yaml -f nginx_loadbalancer.yaml -f frontend_service.yaml -f frontend_deployment.yaml -f backend_deployment.yaml -f backend_service.yaml
kubectl describe service nginx_loadbalancer