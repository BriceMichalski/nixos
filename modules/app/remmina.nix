{ pkgs, lib, ... }:
{
  environment.systemPackages = [
    pkgs.remmina
  ];
}
