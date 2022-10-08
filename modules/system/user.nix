{ pkgs, ... }:
{
  users.users.brice_michalski = {
    isNormalUser = true;
    home = "/home/brice_michalski";
    description = "Brice";
    uid = 1000;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    
    # mkpasswd -m sha-512
    hashedPassword = "$6$2sZttFuWn32qHeK3$gTC3aPaabHegThX1p9XH0CQip14U4lIN4u1pDkzZB37AmgSGdNWI6FtHBzizLyaFbZ22Sen3mVGKt4ZvBOPBB/"
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.username = "brice_michalski";
    home.homeDirectory = "/home/brice_michalski";


    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
  };
}