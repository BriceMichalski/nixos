{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.desktopManager.gnome.enable = true;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "brice_michalski";
    };
    gdm.enable = true;
  };

}