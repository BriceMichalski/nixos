{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in

{
  environment.etc = {
    "NetworkManager/system-connections/c4vpn.nmconnection" = {
      user = "root";
      group = "root";
      mode = "0600";
      text = "
[connection]
id=c4vpn
uuid=7b9ab846-3261-46ea-aeb5-381b8db71237
type=vpn
autoconnect=false
permissions=user:brice_michalski:;

[vpn]
connection-type=password
gateway=${sysconfig.secrets.WORK_VPN_GW}
ignore-cert-warn=yes
password-flags=0
refuse-chap=yes
refuse-eap=yes
refuse-mschap=no
refuse-mschapv2=no
refuse-pap=yes
tls-ext=yes
tls-verify-key-usage=no
user=${sysconfig.secrets.LDAP_USER}
service-type=org.freedesktop.NetworkManager.sstp

[vpn-secrets]
password=${sysconfig.secrets.LDAP_PASSWORD}

[ipv4]
method=auto

[ipv6]
addr-gen-mode=stable-privacy
method=auto

[proxy]

";
    };
  };
}
