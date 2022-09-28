{ config, pkgs, ... }:

{
  networking.hostName = "heinsenberg";
  
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  
  # Enable swap on luks
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".device = "/dev/disk/by-uuid/97301938-e0d9-4240-ae53-a767442be510";
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".keyFile = "/crypto_keyfile.bin";
}





