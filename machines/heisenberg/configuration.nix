{ config, pkgs, environment, ... }:

{
  networking.hostName = "heisenberg";
  
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;   
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable swap on luks
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".device = "/dev/disk/by-uuid/97301938-e0d9-4240-ae53-a767442be510";
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".keyFile = "/crypto_keyfile.bin";
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  
  imports = [
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/nvidia.nix>
  ];

}
