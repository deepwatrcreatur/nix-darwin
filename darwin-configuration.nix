{ config, pkgs, ... }:
{
  nix.enable = false; # Disable Nix-Darwin's Nix management
  
  # System-level packages and core utilities
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
  ];
  
  # Enable the Tailscale service
  services.tailscale.enable = true;
  system.stateVersion = 4;
}

