{ pkgs, lib, ... }:
{
  environment.systemPackages = [
    pkgs.postman
  ];
}
