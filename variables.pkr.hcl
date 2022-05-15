variable "proxmox_api_url" {
  type        = string
  default     = "${env("PROXMOX_URL")}"
  description = "Url do servidor Proxmox"
}

variable "proxmox_api_token_id" {
  type        = string
  default     = "${env("PROXMOX_USERNAME")}"
  description = "Chave gerada no Proxmox"
}

variable "proxmox_api_token_secret" {
  type        = string
  default     = "${env("PROXMOX_TOKEN")}"
  description = "Secret token gerado no Proxmox"
}

variable "proxmox_node" {
  type        = string
  description = "Hostname no proxmox"
}

variable "proxmox_vm_id" {
  type        = string
  description = "Seta um id para o template"
}

variable "proxmox_vm_name" {
  type        = string
  description = "Seta um nome para o template"
}

variable "proxmox_template_description" {
  type        = string
  description = "Seta uma descrição para o template"
}

variable "proxmox_os_type" {
  type        = string
  description = "Define o tipo de sistema operacional: Linux/Windows/Other"
}

variable "proxmox_vm_core" {
  type        = string
  description = "Define a quantidade de cores do template"
}

variable "proxmox_vm_memory" {
  type        = string
  description = "Define a quantide de memória do template"
}

variable "proxmox_scsi_controller" {
  type        = string
  description = "O modelo de controlador que o Proxmox irá emular"
}

variable "proxmox_disk_size" {
  type        = string
  description = "Tamanho do disco alocado para o template"
}

variable "proxmox_disk_format" {
  type        = string
  description = "O formato do disco como raw, cow, qcow2 e vmdk"
}

variable "proxmox_storage_pool" {
  type        = string
  description = "O nome do storage local"
}

variable "proxmox_storage_type" {
  type        = string
  description = "Seta o tipo do storage como lvm, lvm-thin, ceph etc."
}

variable "proxmox_disk_type" {
  type        = string
  description = "Define o tipo do disco"
}

variable "proxmox_vm_network_model" {
  type        = string
  description = "Define o modelo do adptador de rede"
}

variable "proxmox_vm_bridge" {
  type        = string
  description = "Define a interface de bridge"
}

variable "proxmox_iso_file" {
  type        = string
  description = "O nome da imagem, ex: ubuntu.iso"
}

variable "proxmox_iso_storage" {
  type        = string
  description = "Storage de armazenamento da imagem iso"
}
variable "proxmox_ssh_username" {
  type        = string
  description = "Usuário da VM"
}

variable "proxmox_ssh_password" {
  type        = string
  description = "Senha da VM"
}
