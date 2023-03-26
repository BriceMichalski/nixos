{ config, pkgs, ... }:

{
  imports =
    [
      ./browser.nix
      ./jetbrain.nix
      ./mongo-compass.nix
      ./postman.nix
      ./terminator.nix
      ./spotify.nix
      ./vlc.nix
      ./vscode.nix
    ];
}
