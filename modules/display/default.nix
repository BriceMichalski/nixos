{ config, pkgs, ... }:

{
  imports =
    [
      # Display config
      ./manager.nix
      ./gnome.nix
    ];
}
