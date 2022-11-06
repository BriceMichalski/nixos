{ config, pkgs, ... }:

{
  system.stateVersion = "22.05";
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      ##
      # NIXOS
      ##
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix

      ##
      # EXTENSION
      ##
      <home-manager/nixos>

      ##
      # MODULES
      ##
      ./modules/app
      ./modules/display
      ./modules/ops
      ./modules/shell
      ./modules/system

      # Mess
      ./modules/mess.nix
    ];
}
