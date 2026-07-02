resource "kubernetes_namespace" "chaos_mesh" {
  metadata {
    name = "chaos-mesh"
  }
}

resource "helm_release" "chaos_mesh" {
  name       = "chaos-mesh"
  namespace  = kubernetes_namespace.chaos_mesh.metadata[0].name
  repository = "https://charts.chaos-mesh.org"
  chart      = "chaos-mesh"
  version    = "2.7.0"

  set {
    name  = "dashboard.create"
    value = "true"
  }

  set {
    name  = "dashboard.securityMode"
    value = "false"
  }
}
