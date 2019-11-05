# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "MyUbuntuLatest" {
  image = "${docker_image.ubuntu.latest}"
  name  = "MyUbuntuLatest"
  rm = true
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}
