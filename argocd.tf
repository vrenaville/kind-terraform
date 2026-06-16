resource "helm_release" "argocd" {
  name              = "argocd"
  repository        = "https://argoproj.github.io/argo-helm"
  chart             = "argo-cd"
  version           = "5.24.1" # Specify the version for consistency
  namespace         = "argocd"
  create_namespace  = true

  set = [
    {
      name  = "server.service.type"
      value = "LoadBalancer" # Change to ClusterIP if needed
    },
    {
      name  = "server.ingress.enabled"
      value = "false" # Set to true if you want to enable ingress
    }
  ]

 
}