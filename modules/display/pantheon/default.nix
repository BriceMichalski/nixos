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
      "launchpad/plank" = {
        enabled-docks = [ "mbdock" ];
      };
      
      "launchpad/plank/docks/mbdock" = {
        alignment = "center";
        auto-pinning = false;
        current-workspace-only = false;
        dock-items = [ "org.gnome.Epiphany.dockitem" "desktop.dockitem" "code.dockitem" "io.elementary.terminal.dockitem" "trash.dockitem" ];
        hide-delay = 0;
        hide-mode = "intelligent";
        icon-size = 44;
        items-alignment = "center";
        lock-items = false;
        monitor = "";
        offset = 0;
        pinned-only = false;
        position = "bottom";
        pressure-reveal = false;
        show-dock-item = false;
        theme = "Transparent";
        tooltips-enabled = true;
        unhide-delay = 0;
        zoom-enabled = true;
        zoom-percent = 150;
      };

      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/brice_michalski/.local/share/backgrounds/wallpaper.jpg";
      };

  };

  };
}