{ config, pkgs, ... }:

{
  imports =
    [
      ./locale.nix
      ./user.nix
      ./fwupd.nix
      ./network
      ./sound.nix
      ./printing.nix
    ];
}
