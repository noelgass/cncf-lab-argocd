resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"

  set {
    name  = "skip_crds"
    value = "false"
  }

  version = "6.10.0"

  values = [
    file("${path.module}/config/argocd/values.yaml")
  ]
}

resource "kubernetes_manifest" "argocd_bootstrap" {
  manifest = yamldecode(file("${path.module}/config/argocd/bootstrap.yaml"))

  depends_on = [ helm_release.argocd ]
}