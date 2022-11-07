{ pkgs,config, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <unstable> { config = baseconfig; };
  helm-with-plugins = pkgs.wrapHelm pkgs.kubernetes-helm {
    plugins = with pkgs.kubernetes-helmPlugins;
      [
        # allow helmfile diff
        helm-diff
      ];
  };
in
{
  home-manager.users.brice_michalski = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Kubernetes cli
      kubectl
      # Interactive cli
      kube-prompt
      # Cluster/namespace switcher
      kubectx
      # Terminal UI
      k9s
      # Helm deployments
      helm-with-plugins
      helmfile
      # To see logs of several pods
      kubetail
      # Colors for kubectl
      kubecolor

      unstable.pinniped
    ];

    home = {
      shellAliases = {
        # always colorize kubectl output
        kubectl = "kubecolor";
      };
    };

    programs = {
      neovim = {
        plugins = with pkgs.vimPlugins; [
          vim-helm
        ];
      };
    };

  };
}
