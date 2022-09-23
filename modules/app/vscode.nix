{ config, pkgs, ... }:
{
  home-manager.users.brice_michalski = {
    programs.vscode = {
      enable = true;
    };
  };
}
