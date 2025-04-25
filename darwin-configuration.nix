{ config, pkgs, ... }:
{
  nix.enable = false; # Disable Nix-Darwin's Nix management

  environment.systemPackages = with pkgs; [
    # Core system utilities
    bash
    curl
    wget
    git
    gnupg
    watch

    # System monitoring and networking
    htop
    btop
    iperf3
    nmap
    tailscale
    tailscale-gitops-pusher

    # System libraries and dependencies
    libuv
    lz4
    lzo
    sqlite

    # Media and file processing tools
    ffmpeg
    rclone

    # Shell and terminal tools (moved from home.packages)
    fish
    fzf
    grc
    lsd
    bat
    tmux
    starship
    fastfetch
    kitty

    # Development tools and languages
    neovim
    python3
    erlang
    elixir
    elixir-ls
    go
    gh
    gh-actions-cache
    rustup

    # Language servers & formatters
    nil
    nixd
    nixpkgs-fmt

    # CLI utilities and tools
    chezmoi
    stow
    yt-dlp
    glow
    mix2nix
    virt-viewer
  ];

  services.tailscale.enable = true;
  system.stateVersion = 4;
}

