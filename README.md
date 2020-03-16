# Spinnaker Sandbox

## Summary

* Deploy MinIO Storage
* Deploy Spinnaker on K8S (docker-for-desktop context)
* Enable Artifacts
  * Add Helm Artifact to deploy charts

## Requirements

* Docker Desktop (with Kubernetes enabled)

## Configuration

* Copy your `~/.kube/config` inside the folder and rename it  `kube_config`.
* Remove all contexts but `docker-for-desktop`.
* In `clusters`: Replace in `server` the host from `localhost` to `host.docker.internal`

* Start Compose
```
docker-compose up -d
```

* Once `halyard` is up, run the following command to deploy Spinnaker
```
docker-compose exec halyard bash /home/spinnaker/setup.sh
```

* Once the deploy is done, run the following command to proxy the application
```
docker-compose exec halyard bash /home/spinnaker/connect.sh
```

* Access Spinnaker on `http://localhost:9000`
* Access MinIO on `http://localhost:9001`


## Guides

* https://www.spinnaker.io/guides/user/get-started/
* https://aws.amazon.com/blogs/opensource/deployment-pipeline-spinnaker-kubernetes/

