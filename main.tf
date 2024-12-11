terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"  # Utiliser une version spécifique ou une plage de versions
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"  # Remplacez par l'URL de votre hôte Docker si nécessaire
}

