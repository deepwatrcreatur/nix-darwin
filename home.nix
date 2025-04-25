{ config, pkgs, lib, ... }:
let
  username = "deepwatrcreatur";
  homeDirectory = "/Users/${username}";
in
{
  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.11";

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
      { name = "fzf"; src = pkgs.fishPlugins.fzf; }
      { name = "z"; src = pkgs.fishPlugins.z; }
      { name = "puffer"; src = pkgs.fishPlugins.puffer; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair; }
      { name = "grc"; src = pkgs.fishPlugins.grc; }
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish; }
    ];
    interactiveShellInit = ''
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      end
      set -g theme_color_scheme solarized
      set -g theme_powerline_fonts no
      set -g theme_project_dir_length 1
      set -g theme_show_exit_status yes
      set -g theme_display_git_untracked yes
    '';
  };

  programs.helix = {
    enable = true;
    package = pkgs.helix;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixd
      nixpkgs-fmt
      elixir-ls
    ];
    settings = import ./helix-settings.nix;
    languages = import ./helix-languages.nix { inherit pkgs; };
  };

  # home.packages = [ ]; # (optional: leave empty or remove)
  home.sessionPath = [ "$HOME/.cargo/bin" ];
  home.sessionVariables = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
  };

  programs.home-manager.enable = true;
}

