# cncf-lab-argocd

## Developer

### Terraform

```code
terraform init
terraform apply --auto-approve
```

### Helm Manifest

```code
helm template <name> <chart> --output-dir <path/to/dir> --skip-tests
```

### Workaround

```shell
kubectl apply -f gitops/apps/bootstrap/workloads.yaml
```

Question:

- How to boostrap automatically
