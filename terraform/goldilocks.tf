resource "kubernetes_namespace" "goldilocks" {
  metadata {
    name = "goldilocks"
  }
}

resource "helm_release" "goldilocks" {
  name       = "goldilocks"
  namespace  = kubernetes_namespace.goldilocks.metadata[0].name
  repository = "https://charts.fairwinds.com/stable"
  chart      = "goldilocks"
  version    = "6.0.0"
}
