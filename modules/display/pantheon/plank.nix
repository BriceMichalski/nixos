{ pkgs, ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    dconf.settings = {
      "net/launchpad/plank" = {
        enabled-docks = [ "mbdock" ];
      };
      
      # Plank settings
      "net/launchpad/plank/docks/mbdock" = {
        alignment = "center";
        auto-pinning = false;
        current-workspace-only = false;
        dock-items = [ "desktop.dockitem" "google-chrome.dockitem" "code.dockitem" "io.elementary.terminal.dockitem" "terminator.dockitem" "trash.dockitem" ];
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
    };

    # Dockitem
    home.file = {
      ".config/plank/mbdock/launchers/code.dockitem".source = ./dockitem/code.dockitem;
      ".config/plank/mbdock/launchers/trash.dockitem".source = ./dockitem/trash.dockitem;
      ".config/plank/mbdock/launchers/desktop.dockitem".source = ./dockitem/desktop.dockitem;
      ".config/plank/mbdock/launchers/terminator.dockitem".source = ./dockitem/terminator.dockitem;
      ".config/plank/mbdock/launchers/google-chrome.dockitem".source = ./dockitem/google-chrome.dockitem;
      ".config/plank/mbdock/launchers/io.elementary.terminal.dockitem".source = ./dockitem/io.elementary.terminal.dockitem;
    };
  };
}