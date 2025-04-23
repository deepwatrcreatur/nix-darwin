{ config, pkgs, ... }:

{
  nix.enable = false; # Disable Nix-Darwin's Nix management

  environment.systemPackages = with pkgs; [
    yt-dlp
    glow
    rclone
    git
    gh-actions-cache
    bash
    python3
    erlang
    elixir
    go
    kitty
    fish
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
    tailscale
    tailscale-gitops-pusher
    virt-viewer
  ];

  # Enable the Tailscale service
  services.tailscale.enable = true;

  system.stateVersion = 4;
}

