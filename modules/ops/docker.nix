{ pkgs, lib, ... }:
{
  virtualisation.docker.enable = true;

  users.users.brice_michalski = {
    extraGroups = [ "docker" ];
  };

  environment.systemPackages = [
    pkgs.docker-compose
    pkgs.kind
  ];

}
