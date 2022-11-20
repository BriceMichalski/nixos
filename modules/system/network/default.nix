{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-sstp
    ];
    dispatcherScripts = [
      {
        source = pkgs.writeText "upHook" ''

          if [ "$2" = "vpn-up" ]; then
            ${pkgs.unixtools.ifconfig}/bin/ifconfig "$1" mtu 1390 up
          fi

    '';
        type = "basic";
      }
    ];
  };

  security.sudo.extraConfig = "
    Defaults env_keep += http_proxy
    Defaults env_keep += https_proxy
    Defaults env_keep += no_proxy
    Defaults env_keep += CURL_NIX_FLAGS
  ";

  systemd.services.NetworkManager-wait-online.enable = false;

  imports =
    [
      ./c4vpn.nix
      ./proxy.nix
    ];
}
