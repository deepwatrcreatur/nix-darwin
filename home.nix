{ config, pkgs, lib, ... }:
let
  username = "deepwatrcreatur";
  homeDirectory = "/Users/${username}";

in
{
  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.11"; # Please update this to your actual state version

  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx EDITOR hx
      set -gx VISUAL hx
    '';
    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -a";
      lla = "lsd -la";
      ".." = "cd ..";
      update = "darwin-rebuild switch --flake ${homeDirectory}/nix-darwin-config/#$(hostname)";
    };
    plugins = [
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish; }
      { name = "z"; src = pkgs.fishPlugins.z; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair; }
      { name = "grc"; src = pkgs.fishPlugins.grc; }
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish; }
    ];
    interactiveShellInit = ''
      set -g theme_color_scheme solarized
      set -g theme_powerline_fonts no
      set -g theme_project_dir_length 1
      set -g theme_show_exit_status yes
      set -g theme_display_git_untracked yes
    '';
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixd
      nixpkgs-fmt
      elixir-ls
    ];

    settings = import ./helix-settings.nix; # <-- Simplified import

    languages = import ./helix-languages.nix { inherit pkgs; };
  };

  home.packages = with pkgs; [
    fish
    fzf
    grc
    lsd
    helix
    # Language servers & formatters (also ensures they are in PATH)
    nil
    nixd
    nixpkgs-fmt
    elixir-ls
    elixir # Needed for `mix format` if you enable it
  ];

  programs.home-manager.enable = true;
}
