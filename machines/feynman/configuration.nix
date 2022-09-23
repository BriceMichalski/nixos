{ config, pkgs, ... }:

{
  networking.hostName = "feynman";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;   
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  
  # Enable swap on luks
  boot.initrd.luks.devices."luks-3fc68794-8efd-4bc3-9f03-b56ab7a604d7".device = "/dev/disk/by-uuid/3fc68794-8efd-4bc3-9f03-b56ab7a604d7";
  boot.initrd.luks.devices."luks-3fc68794-8efd-4bc3-9f03-b56ab7a604d7".keyFile = "/crypto_keyfile.bin";
}