##
# (Neo)Vim configuration
##
{ pkgs, ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}