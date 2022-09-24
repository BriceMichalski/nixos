{ pkgs, ... }:
{
  users.users.brice_michalski = {
    isNormalUser = true;
    home = "/home/brice_michalski";
    description = "Brice";
    uid = 1000;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.username = "brice_michalski";
    home.homeDirectory = "/home/brice_michalski";


    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
  };
}