{ config, pkgs, ... }:

{
  nix.enable = false; # Disable Nix-Darwin's Nix management

  environment.systemPackages = with pkgs; [
    yt-dlp
    glow
    rclone
    git
    gh
    bash
    python3
    kitty
    nano
    neovim
    chezmoi
    stow
    gnupg
    fastfetch
    mix2nix
    iperf3
    htop
    btop
    fzf
    bat
    wget
    curl
    nmap
    tmux
    ffmpeg
    libuv
    lz4
    lzo
    sqlite
    starship
    watch
  ];

  system.stateVersion = 4;
}

