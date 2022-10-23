{ pkgs, ... }:
{

  environment.shells = [ pkgs.zsh pkgs.bashInteractive ];

  users.users.brice_michalski = {
    isNormalUser = true;
    description = "Brice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = false;
    initialPassword = "changeme";
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.username = "brice_michalski";
    home.homeDirectory = "/home/brice_michalski";

    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
  };

  security.sudo.wheelNeedsPassword = false;
}
