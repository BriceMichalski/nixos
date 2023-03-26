{ config, pkgs, ... }:

{
  imports =
    [
      ./java.nix
      ./nodejs.nix
      ./python.nix
    ];
}
