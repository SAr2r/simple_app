resource "kubernetes_deployment" "simpleapp" {
  metadata {
    name = "simpleapp"
    labels = {
      app = "simpleapp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "simpleapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "simpleapp"
        }
      }

      spec {
        container {
          image = "jjjje/test:da56cb5595e21bc1e388b9cd285f9a604b91afe2"
          name  = "simpleapp"
          env {
            name = "MY_ENV_VAR"
            value = "hello"
          }
          port {
            container_port = 5000
          }
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simpleapp" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      app = "simpleapp"
    }
    session_affinity = "ClientIP"
    port {
      port        = 5000
      target_port = 5000
      node_port   = 8080
    }

    type = "NodePort"
  }
}