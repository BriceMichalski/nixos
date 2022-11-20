{ config, pkgs, ... }:

{
  imports =
    [
      ./ansible.nix
      ./docker.nix
      ./kube.nix
      ./sops.nix
      ./terraform.nix
      ./virtualization.nix
    ];
}
