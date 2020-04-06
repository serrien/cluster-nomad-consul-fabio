job "webserver" {
  datacenters = ["cbp-sandbox-eu-west-3-DC1"]
  type = "service"

  group "webserver" {
    count = 3
    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }
    ephemeral_disk {
      size = 300
    }

    # Add an update stanza to enable rolling updates of the service
    update {
      max_parallel = 1
      min_healthy_time = "30s"
      healthy_deadline = "2m"
    }

    task "apache" {
      driver = "docker"
      config {
        image = "httpd:latest"
        port_map {
          http = 80
        }
      }

      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "apache-webserver"
        tags = ["urlprefix-/foo/ strip=/foo"]
        port = "http"
        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
