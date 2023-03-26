{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jetbrains.idea-community
  ];
}

