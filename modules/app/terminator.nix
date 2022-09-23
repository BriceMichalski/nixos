{ pkgs, ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    programs = {
      terminator = {
        enable = true;
        config = {
          profiles.default.show_titlebar = false;
          profiles.default.scrollbar_position = "hidden";
        };
      };
    };
  };
}