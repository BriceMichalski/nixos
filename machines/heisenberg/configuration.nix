{ config, pkgs, ... }:

{
  networking.hostName = "heisenberg";
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;   
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "dell-smm-hwmon" ];

  # Cooling Management
  services.thermald.enable = true;

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  environment.etc = {
  # Creates /etc/nanorc
  nanorc = {
    text = ''
      whatever you want to put in the file goes here.
    '';

    # The UNIX file mode bits
    mode = "0440";
  };
};

  # Enable swap on luks
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".device = "/dev/disk/by-uuid/97301938-e0d9-4240-ae53-a767442be510";
  boot.initrd.luks.devices."luks-97301938-e0d9-4240-ae53-a767442be510".keyFile = "/crypto_keyfile.bin";
}
