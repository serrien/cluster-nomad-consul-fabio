job "certificates" {
  datacenters = ["cbp-sandbox-eu-west-3-DC1"]
  type = "service"

  group "certificates" {
    count = 1
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

    task "certificates" {
      driver = "docker"
      config {
        image = "370779979152.dkr.ecr.eu-west-3.amazonaws.com/certificates:0.0.3"
        network_mode = "host"
        port_map {
          http = 10000
        }
      }

      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "cretificate"
        tags = ["urlprefix-/.well-known/acme-challenge/"]
        port = "http"

      }
    }
  }
}
