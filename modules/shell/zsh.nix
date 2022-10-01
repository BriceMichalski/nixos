{ pkgs, lib, ... }:
{
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.brice_michalski = { pkgs, ... }: {
    programs = {
      bat = {
        enable = true;
      };
      jq.enable = true;
      direnv.enable = true;
      tmux.enable = true;
      autojump.enable = true;
      fzf.enable = true;
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        enableCompletion = true;
        shellAliases = {
          ll = "exa -l";
          tree = "exa -l -T";
          cat = "bat --paging=never";
          nix-up = "sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --upgrade";
          nix-ls =  "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
          nix-gc = "sudo nix-collect-garbage -d --delete-older-than 10d";
        };
        initExtra = "
          eval $(thefuck --alias)
        ";
        oh-my-zsh = {
          enable = true;
          theme = "bira";
        };
      };
    };
  };
}