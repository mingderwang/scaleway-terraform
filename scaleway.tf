provider "scaleway" {
  access_key      = "change_me"
  secret_key      = "change_me"
  organization_id = "change_me"
  zone            = "fr-par-1"
  region          = "fr-par"
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 50
  type = "l_ssd"
}

resource "scaleway_instance_server" "my-ubuntu-instance" {
  type  = "C1"
  image = "ubuntu-bionic"

  tags = [ "FocalFossa", "MyUbuntuInstance" ]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [ scaleway_instance_volume.data.id ]

}
