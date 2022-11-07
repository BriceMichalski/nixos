{ config, pkgs, ... }:

{
  imports =
    [
      ./env.nix
      ./zsh.nix
      ./vim.nix
      ./git.nix
      ./packages.nix
    ];
}
