{ config, pkgs, ... }:
{

  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  home-manager.users.brice_michalski = { pkgs, lib, ... }: {
    home.file = {
      ".local/share/backgrounds/wallpaper.jpg".source = ./wallpaper.jpg;
    };

    home.packages = with pkgs; [
      # to allow nix to set gnome settings
      dconf
      # to search for settings to change
      gnome.dconf-editor
      # to generate nixconfig from dconf
      dconf2nix
      # to change settings manually
      gnome.gnome-tweaks
    ];

    dconf.settings = {
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
      };
      "org/gnome/shell" = {
        # apps on dock
        favorite-apps = [
          # Fichier
          "org.gnome.Nautilus.desktop"
          # Mail
          "org.gnome.Geary.desktop"
          # music
          "spotify.desktop"
          # vscode
          "code.desktop"
          # chrome
          "google-chrome.desktop"
          # terminal
          "terminator.desktop"
        ];
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/brice_michalski/.local/share/backgrounds/wallpaper.jpg";
        picture-uri-dark = "file:///home/brice_michalski/.local/share/backgrounds/wallpaper.jpg";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
