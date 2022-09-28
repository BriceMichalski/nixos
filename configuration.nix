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
      # User config
      ./modules/system/user.nix
      ./modules/system/fwupd.nix
      # Display config
      ./modules/display/manager.nix
      ./modules/display/pantheon/default.nix
      ./modules/display/pantheon/plank.nix
      # Shell config
      ./modules/shell/locale.nix
      ./modules/shell/zsh.nix
      ./modules/shell/vim.nix  
      ./modules/shell/packages.nix
      # App config
      ./modules/app/vscode.nix
      ./modules/app/browser.nix
      ./modules/app/terminator.nix

    ];

  # Enable networking
  networking.networkmanager.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
}
