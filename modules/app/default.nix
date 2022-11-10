{ config, pkgs, ... }:

{
  imports =
    [
      ./vscode.nix
      ./browser.nix
      ./terminator.nix
      ./spotify.nix
    ];
}
