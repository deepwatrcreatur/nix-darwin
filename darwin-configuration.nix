{ config, pkgs, ... }:
{
  nix.enable = false; # Required for Determinate Nix Installer

  # Only truly system-wide tools here (optional)
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    gnupg
    htop
    btop
    nmap
  ];
  
  programs.fish.enable = true;

  services.tailscale.enable = true;
  system.stateVersion = 4;
}

