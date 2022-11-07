{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in

{
  home-manager.users.brice_michalski = { ... }: {
    home.file = {
      ".envrc" = {
        target = ".envrc";
        text = ''
        export ANSIBLE_REMOTE_USER="brice_michalski"
        export SOPS_AGE_KEY_FILE=~/.age/keys.txt
        export EDITOR=vim
        export LDAP_USER="${sysconfig.secrets.LDAP_USER}"
        export LDAP_PASSWORD="${sysconfig.secrets.LDAP_PASSWORD}"
        export PROXY_HOST="${sysconfig.secrets.PROXY_HOST}"
        export PROXY_PORT="${sysconfig.secrets.PROXY_PORT}"
        export PROXY_PAC="${sysconfig.secrets.PROXY_PAC}"
        export VAULT_ADDR="${sysconfig.secrets.VAULT_ADDR}"
        export VAULT_TOKEN="${sysconfig.secrets.VAULT_TOKEN}"
        export WORK_GIT_REGISTRY="${sysconfig.secrets.WORK_GIT_REGISTRY}"
        export WORK_DOCKER_REGISTRY="${sysconfig.secrets.WORK_DOCKER_REGISTRY}"
        export WORK_VPN_GW="${sysconfig.secrets.WORK_VPN_GW}"
        export WORK_EMAIL="${sysconfig.secrets.WORK_EMAIL}"
        '';
      };
    };
  };
}
