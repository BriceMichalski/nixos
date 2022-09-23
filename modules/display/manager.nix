{ config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the LightDM display manager.
  services.xserver.displayManager.lightdm.enable = true;
  
}