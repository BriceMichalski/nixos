{ pkgs, ... }:
{

  environment.shells = [ pkgs.zsh pkgs.bashInteractive ];

  users.users.brice_michalski = {
    isNormalUser = true;
    description = "Brice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = false;
    hashedPassword = "$6$AvwI84wQZEukuI1Q$SvmqIxPn2.D2zZjYVPavcweRLEmB4.GwLVj3OsE9rb0D5vneH2DYjGEak2OMTUSUuRv2PXgST3QTBmGnpjM1S0";
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.username = "brice_michalski";
    home.homeDirectory = "/home/brice_michalski";

    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
  };

  security.sudo.wheelNeedsPassword = false;
}
