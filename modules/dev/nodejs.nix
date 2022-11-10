{ ... }:
{
  home-manager.users.brice_michalski = { pkgs, ... }: {

    home.packages = with pkgs; [
      nodejs
      yarn
      nodePackages.npm
      nodePackages.prettier
      nodePackages.vue-cli
      nodePackages."@angular/cli"
    ];

    programs.vscode = {
      extensions = with pkgs.vscode-extensions; [
      ];
    };
  };
}
