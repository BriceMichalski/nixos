{ pkgs, ... }:
{
  users.users.brice_michalski = {
    isNormalUser = true;
    description = "Brice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    initialPassword = "changeme";
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.username = "brice_michalski";
    home.homeDirectory = "/home/brice_michalski";

    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
  };
}
