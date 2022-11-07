{ pkgs, ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    programs = {
      spotify = {
        enable = true;
      };
    };
  };
}

