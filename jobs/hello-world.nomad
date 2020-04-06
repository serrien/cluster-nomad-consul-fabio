job "hello-world" {
  datacenters = ["cbp-sandbox-eu-west-3-DC1"]
  type = "batch"


  group "hello-world" {

    task "hello-world" {
      driver = "docker"
      config {
        image = "hello-world:latest"
      }
    }
  }
}
