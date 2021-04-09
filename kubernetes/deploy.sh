#!/bin/bash
kubectl apply -f namespace.yaml
kubectl config set-context --current --namespace=cneNamespace
kubectl apply -f nginx_config.yaml
kubectl apply

# best way to restart pods - application will not go down is to do a rollout restart
kubectl rollout restart deployment/frontend
kubectl rollout restart deployment/backend


kubectl apply -f nginx_conf.yaml nginx_deployment.yaml nginx_loadbalancer.yaml frontend_service.yaml frontend_deployment.yaml backend_deployment.yaml backend_service.yaml
kubectl describe service nginx_loadbalancer