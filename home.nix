{ config, pkgs, lib, ... }:
let
  username = "deepwatrcreatur";
  homeDirectory = "/Users/${username}";
in
{
  imports = [
    ./modules/home/fish.nix
    ./modules/home/helix.nix
    ./modules/home/jujutsu.nix
  ];

  home.username = username;
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "24.11";

  # All your CLI tools and user packages here!
  home.packages = with pkgs; [
    fish
    fzf
    grc
    lsd
    bat
    tmux
    starship
    fastfetch
    kitty
    neovim
    python3
    erlang
    elixir
    elixir-ls
    go
    gh
    gh-actions-cache
    rustup
    nil
    nixd
    nixpkgs-fmt
    chezmoi
    stow
    yt-dlp
    glow
    mix2nix
    virt-viewer
  ];

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "/run/current-system/sw/bin"
     ];
  home.sessionVariables = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
  };

  programs.home-manager.enable = true;
}

