{ config, pkgs, ... }:

{
  system.stateVersion = "22.05";
  nixpkgs.config.allowUnfree = true;

  imports =
    [ 
      ##
      # NIXOS
      ##
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix

      ##
      # EXTENSION
      ##
      <home-manager/nixos>

      ##
      # MODULES
      ##
      # System config
      ./modules/system/locale.nix
      ./modules/system/user.nix
      ./modules/system/fwupd.nix
      ./modules/system/network.nix
      ./modules/system/sound.nix
      ./modules/system/printing.nix

      # Display config
      ./modules/display/manager.nix

      # Shell config
      ./modules/shell/zsh.nix
      ./modules/shell/vim.nix  
      ./modules/shell/git.nix
      ./modules/shell/packages.nix

      # Ops soft
      ./modules/ops/docker.nix

      # App config
      ./modules/app/vscode.nix
      ./modules/app/browser.nix
      ./modules/app/terminator.nix

      # Mess 
      ./modules/mess.nix

    ];
  # Enable CUPS to print documents.
 

}
