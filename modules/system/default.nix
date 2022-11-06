{ config, pkgs, ... }:

{
  imports =
    [
      ./locale.nix
      ./user.nix
      ./fwupd.nix
      ./network.nix
      ./sound.nix
      ./printing.nix
    ];
}
