resource "kubernetes_ingress_v1" "voting-ingress" {
  metadata {
    name      = "voting-app"
    namespace = "voting-app"
    labels = {
      name = "vote-front"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "voting.matthewtarfa.me"
      http {
        path {
          backend {
            service{
              name = "azure-vote-front"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = "sock-shop"
    namespace = "sock-shop"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "sock.matthewtarfa.me"
      http {
        path {
          backend {
            service{
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

