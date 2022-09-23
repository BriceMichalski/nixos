{ pkgs, lib, ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.packages = with pkgs; [
      # json/yaml
      dyff
      yq
      fx
      # network tools
      curl
      httpie
      ldns
      bind
      openssl
      nssTools
      # disk
      ncdu
      # archive
      dtrx
      unzip
      p7zip
      # mess
      neofetch
      thefuck
      tree
      envsubst
      glow
      ripgrep
      tldr
      duf
      exa
      glances
      psmisc
    ];
  };
}
