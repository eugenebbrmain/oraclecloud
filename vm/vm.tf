data "oci_core_images" "ubuntu-20-04" {
  compartment_id   = var.compartment_ocid
  operating_system = "Canonical Ubuntu"

  filter {
    name   = "display_name"
    values = ["^Canonical-Ubuntu-20.04-([\\.0-9-]+)$"]
    regex  = true
  }
}

resource "oci_core_instance" "this" {
  availability_domain = var.instance_availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape

  create_vnic_details {
    display_name   = "mybbrVNIC"
    hostname_label = "mybbrvm"
    subnet_id      = oci_core_subnet.this.id
  }

  display_name = "myeugenebbroraclevm"

  metadata = {
    ssh_authorized_keys = file(var.ssh_authorized_keys)
    user_data           = var.user_data
  }

  source_details {
    source_id   = data.oci_core_images.ubuntu-20-04.images.0.id
    source_type = "image"
  }

  preserve_boot_volume = false
}
