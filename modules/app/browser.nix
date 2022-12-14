{ pkgs, ... }:
{
  xdg.portal = {
    # need to set enable-webrtc-pipewire-capturer in chrome
    enable = true;
  };

  home-manager.users.brice_michalski = { pkgs, ... }: {
    programs.firefox = {
      enable = true;
    };
    programs.chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
  };
}