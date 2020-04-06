job "sigsci-agent" {
  datacenters = ["cbp-sandbox-eu-west-3-DC1"]
  type = "system"

  group "sigsci-agent" {
    task "sigsci-agent" {
      driver = "docker"
      config {
        image = "370779979152.dkr.ecr.eu-west-3.amazonaws.com/cbp/sigsci-agent:latest"
        network_mode = "host"
      }

      resources {
        cpu    = 200
        memory = 128
        network {
          mbits = 20
          port "lb" {
            static = 9991
          }
        }
      }
      service {
        name = "sigsci-agent"
      }

      template {
          data = <<EOH
            SIGSCI_ACCESSKEYID = "{{ $host := printf "%s/SIGSCI_AGENT/SIGSCI_ACCESSKEYID" (env "NOMAD_DC") }}{{key $host }}"
            SIGSCI_SECRETACCESSKEY = "{{ $host := printf "%s/SIGSCI_AGENT/SIGSCI_SECRETACCESSKEY" (env "NOMAD_DC") }}{{key $host }}"
            SIGSCI_CLIENT_IP_HEADER = "X-Forwarded-For"
            SIGSCI_REVPROXY_LISTENER = "proxy:{listener=http://0.0.0.0:9991,upstreams=http://0.0.0.0:9999}"
          EOH
          destination = "local/file.yml"
          env         = true
      }
    }
  }
}