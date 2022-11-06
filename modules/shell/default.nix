{ config, pkgs, ... }:

{
  imports =
    [
      ./zsh.nix
      ./vim.nix
      ./git.nix
      ./packages.nix
    ];
}
