resource "oci_core_vcn" "this" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "bbrVCN"
  dns_label      = "mybbrvcn"
}

resource "oci_core_subnet" "this" {
  availability_domain = var.instance_availability_domain
  cidr_block          = "10.0.1.0/24"
  display_name        = "bbrSUBNET"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_vcn.this.id
  route_table_id      = oci_core_vcn.this.default_route_table_id
  security_list_ids   = [oci_core_vcn.this.default_security_list_id]
  dhcp_options_id     = oci_core_vcn.this.default_dhcp_options_id
  dns_label           = "mybbrsubnet"
}

resource "oci_core_default_route_table" "this" {
  manage_default_resource_id = oci_core_vcn.this.default_route_table_id

  route_rules {
    network_entity_id = oci_core_internet_gateway.this.id
    destination       = "0.0.0.0/0"
  }
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.this.id
  display_name   = "Internet_for_vms"
}
