{ config, pkgs, environment, ... }:

{
  networking.hostName = "heisenberg";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/intel>
  ];

}
