output "ubuntu-20-04-latest-name" {
  value = data.oci_core_images.ubuntu-20-04.images.0.display_name
}

output "ubuntu-20-04-latest-id" {
  value = data.oci_core_images.ubuntu-20-04.images.0.id
}

output "instance_ip" {
  value = oci_core_instance.this.public_ip
}
