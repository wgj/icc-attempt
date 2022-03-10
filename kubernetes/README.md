### Setup
```shell
aws --profile wgj eks update-kubeconfig --kubeconfig icc-kubeconfig --name icc-eks
```

### Apply
```shell
kubectl --kubeconfig icc-kubeconfig apply -f deployment.yaml
```

### Test
```shell
kubectl --kubeconfig icc-kubeconfig -n wgj get pods
kubectl --kubeconfig icc-kubeconfig -n wgj delete pod wgj-6799fc88d8-2l2zp
kubectl --kubeconfig icc-kubeconfig -n wgj get pods
```
