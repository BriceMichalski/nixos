{ pkgs, ... }:
{
  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";

  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  i18n.defaultLocale = "fr_FR.utf8";
}