{ config, pkgs, ... }:

{
  imports =
    [
      ./java.nix
      ./nodejs.nix
    ];
}
