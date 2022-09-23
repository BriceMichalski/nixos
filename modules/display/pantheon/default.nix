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
      # to generate nixconfig from dconf
      dconf2nix
    ];

    dconf.settings = {
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/brice_michalski/.local/share/backgrounds/wallpaper.jpg";
      };
    };
  };
}