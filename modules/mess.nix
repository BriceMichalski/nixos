{ pkgs,environment,lib, ... }:
{
    services.thermald.enable = lib.mkDefault true;
}