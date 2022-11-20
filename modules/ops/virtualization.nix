{ ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "brice_michalski" ];

  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.packages = with pkgs; [
      vagrant
      sshpass
    ];
  };
}
