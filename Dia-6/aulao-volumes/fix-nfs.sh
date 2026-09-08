#!/bin/sh
kubectl patch pv meu-pv-nfs --type=merge \
  -p '{"spec":{"mountOptions":["nfsvers=4.2","proto=tcp","port=2049"]}}'
kubectl delete pod -l app=redis --ignore-not-found
