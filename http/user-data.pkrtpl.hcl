#cloud-config
autoinstall:
  version: 1
  early-commands:
    - sudo systemctl stop ssh
  locale: en_US
  keyboard:
    layout: en
    variant: us
  network:
    network:
      version: 2
      ethernets:
        mainif:
          match:
            name: en*
          dhcp4: true
          dhcp6: true
  storage:
    layout:
      name: lvm
  packages:
    - open-vm-tools
    - openssh-server
  identity:
    hostname: ${ hostname }
  ssh:
    install-server: yes
    allow-pw: yes
  refresh-installer:
    update: no
  user-data:
    package_update: false
    package_upgrade: false
    package_reboot_if_required: false
    disable_root: false
    users:
    - name:  ${ ssh_username }
      passwd: ${ ssh_password_hashed }
      lock-passwd: false
      sudo: ALL=(ALL) NOPASSWD:ALL
      shell: /bin/bash

