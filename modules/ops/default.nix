{ config, pkgs, ... }:

{
  imports =
    [
      ./docker.nix
      ./sops.nix
    ];
}
