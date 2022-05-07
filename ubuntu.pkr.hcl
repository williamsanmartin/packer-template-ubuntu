source "proxmox" "ubuntu-server" {
  proxmox_url = "${var.proxmox_api_url}"
  username    = "${var.proxmox_api_token_id}"
  token       = "${var.proxmox_api_token_secret}"

  node                 = "${var.proxmox_node}"
  vm_id                = "${var.proxmox_vm_id}"
  vm_name              = "${var.proxmox_vm_name}"
  template_description = "${var.proxmox_template_description}"
  os                   = "${var.proxmox_os_type}"
  cores                = "${var.proxmox_vm_core}"
  memory               = "${var.proxmox_vm_memory}"


  scsi_controller = "${var.proxmox_scsi_controller}"

  disks {
    disk_size         = "${var.proxmox_disk_size}"
    format            = "${var.proxmox_disk_format}"
    storage_pool      = "${var.proxmox_storage_pool}"
    storage_pool_type = "${var.proxmox_storage_type}"
    type              = "${var.proxmox_disk_type}"
  }

  network_adapters {
    model  = "${var.proxmox_vm_network_model}"
    bridge = "${var.proxmox_vm_bridge}"
  }

  iso_file         = "local:iso/${var.proxmox_iso_file}"
  iso_storage_pool = "${var.proxmox_iso_storage}"
  unmount_iso      = true

  qemu_agent = true

  cloud_init              = true
  cloud_init_storage_pool = "${var.proxmox_storage_pool}"

  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]
  boot      = "c"
  boot_wait = "5s"

  http_directory = "http"

  ssh_username = "${var.proxmox_ssh_username}"
  ssh_password = "${var.proxmox_ssh_password}"
  ssh_timeout  = "25m"
}

build {

  name    = "ubuntu-server-jammy"
  sources = ["source.proxmox.ubuntu-server"]

  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 10; done",
      "sudo rm /etc/ssh/ssh_host_*",
      "sudo truncate -s 0 /etc/machine-id",
      "sudo apt-get -y autoremove --purge",
      "sudo apt-get -y clean",
      "sudo apt-get -y autoclean",
      "sudo cloud-init clean",
      "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
      "sudo sync"
    ]
  }

  provisioner "file" {
    source      = "files/99-pve.cfg"
    destination = "/tmp/99-pve.cfg"
  }

  provisioner "shell" {
    inline = ["sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"]
  }
}
