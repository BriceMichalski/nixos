{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in

{
  networking.networkmanager = {
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

  home-manager.users.brice_michalski = { ... }: {
    home.file = {
      "setproxy.sh".source = ./setproxy.sh;
    };
    home.sessionVariables = {
      PROXY_HOST = sysconfig.secrets.PROXY_HOST;
      PROXY_PORT = sysconfig.secrets.PROXY_PORT;
      LDAP_USER = sysconfig.secrets.LDAP_USER;
      LDAP_PASSWORD = sysconfig.secrets.LDAP_PASSWORD;
      WORK_DOCKER_REGISTRY = sysconfig.secrets.WORK_DOCKER_REGISTRY;
      VAULT_TOKEN = sysconfig.secrets.VAULT_TOKEN;
      VAULT_ADDR = sysconfig.secrets.VAULT_ADDR;
    };
    programs = {
      zsh = {
        initExtra = "
        source $HOME/setproxy.sh
      ";
      };
    };

    dconf.settings = {
      "system/proxy" = {
        mode = "auto";
        autoconfig-url = sysconfig.secrets.PROXY_PAC;
      };
    };
  };
}
