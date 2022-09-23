{ pkgs, ... }:
{
  # Enable pantheon desktop
  services.xserver.desktopManager.pantheon.enable = true;

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.file = {
      ".local/share/backgrounds/wallpaper.jpg".source = ./../wallpaper.jpg;
    };

    home.packages = with pkgs; [
      # to allow nix to set gnome settings
      dconf
      # to search for settings to change
      gnome.dconf-editor

    ];

    # dconf.settings = {
    #   "net/launchpad/plank" = {

    #   }
    # };
  };
}