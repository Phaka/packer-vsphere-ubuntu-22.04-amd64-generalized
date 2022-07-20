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
    hostname: ubuntu
    username: ubuntu
    password: $6$rounds=4096$lrt81Kp8C7xX9A$.W4b0ZI5bAX27meBpFqeCr5zzIO64xpmlhpJLUWpfzmiDIG4EUJSrXGtkKl2lA14PqPtXWo6.7CuzA2vnAUns1
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
  late-commands:
    - echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /target/etc/sudoers.d/ubuntu
    - curtin in-target --target=/target -- chmod 440 /etc/sudoers.d/ubuntu
