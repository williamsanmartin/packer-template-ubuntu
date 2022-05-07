# packer-ubuntu-22-04
Arquivos de configuração para a criação de um template do Ubuntu Server 22.04 no hypervisor Proxmox.

## Pré-equisitos

Crie uma __chave__ e um __token__ de acesso, conforme este exemplo: [Proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs).

Agora exporte a chave, token e a url de conxão em seu terminal, conforme exemplo abaixo.

```
export PROXMOX_URL=https://IP_PROXMOX:8006/api2/json
export PROXMOX_USERNAME=user@pve!token
export PROXMOX_TOKEN=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
```

Execute os comandos as baixos para buildar o template.
```
packer init -var-file=variables.pkrvars.hcl .
packer build -var-file=variables.pkrvars.hcl  .
```
![](img/output-terminal.png)

Lembre-se, a costrução deste template é em cima do Cloud-Init, sendo assim, a configuração de novas VMs a partir dele também deverá seguir este padrão.

Isto é, após o clone do template para uma nova VM, configure o usuário, senha,
IP, DNS, DOMAIN e SSH Key através da aba **Cloud-Init**.

![Exemplo](img/example-cloud-init.png)

