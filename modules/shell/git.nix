{ pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in

{
  home-manager.users.brice_michalski = { pkgs, ... }: {

    home.packages = with pkgs; [
      # clone any repo in a predictive path
      ghq
      # clean merged branch
      git-trim
    ];

    programs = {
      git = {
        # Base config
        enable = true;
        userName = "Brice Michalski";
        userEmail = "brice.michalski.92@gmail.com";

        # Extra config
        extraConfig = {
          "pull" = {
            rebase = false;
          };
          # Path to all my repos
          "ghq" = {
            root = "~/repos";
          };
          "credential" = {
            helper = "store";
          };
        };

        includes = [
          {
            condition = "gitdir:**/*" + sysconfig.secrets.WORK_GIT_REGISTRY + "/**";
            contents = {
              user = {
                email = sysconfig.secrets.WORK_EMAIL;
              };
            };
          }
        ];
        # # Better looking diff
        # delta = {
        #   enable = true;
        #   options = {
        #     light = false;
        #     navigate = true;
        #   };
        # };

        # Patterns i want to ignore across repositories
        ignores = [
          "gignore*"
        ];
      };
    };
  };
}
