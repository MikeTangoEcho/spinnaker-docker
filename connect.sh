#!/bin/sh

kubectl  port-forward -n spinnaker --address 0.0.0.0 svc/spin-deck 9000:9000 &
kubectl  port-forward -n spinnaker --address 0.0.0.0 svc/spin-gate 8084:8084 &

wait