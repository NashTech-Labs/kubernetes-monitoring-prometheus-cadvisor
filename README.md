# README

This template contains a prometheus yaml config and k8s clusterroles and rolebindings that can be used to monitor k8s using the cadvisor metrices exposed.

## Deploy Clusterrole

To deploy clusterrole and clusterrolebinding, execute:
```
kubectl apply -f rabc
```

To get the api server certificate and access token, execute the following commands:
```
kubectl get secret $(kubectl get sa prometheus -n default -o yaml -o jsonpath="{.secrets[].name}") -o jsonpath="{.data.ca\.crt}" | base64 -d > ca.crt

kubectl get secret $(kubectl get sa prometheus -n default -o yaml -o jsonpath="{.secrets[].name}") -o jsonpath="{.data.token}" | base64 -d > ca.token
```

## Configure the environments

In the file env.sh set the variables
| Name | Description|
| - | - |
| API_SERVER | Api server endpoint
| BEARER_TOKEN_FILE_PATH | Path to the `token` file 
| CA_FILE_PATH | Path to the `ca.crt` file

Set the above variables in env.sh and run `bash -x env.sh`

## Generate the prometheus config

To generate prometheus config, execute the command:
```
envsubst < prometheus.yaml.env > prometheus.yaml
```

## To start the prometheus

```
./prometheus --config.file prometheus.yaml
```