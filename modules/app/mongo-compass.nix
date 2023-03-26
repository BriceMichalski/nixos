{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.mongodb-compass
  ];
}

