client {
  enabled = true
}

plugin "docker" {
  config {
    allow_privileged = true
    auth {
      config = "/home/ubuntu/.docker/config.json"
    }
  }
}
