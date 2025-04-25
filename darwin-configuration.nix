{ config, pkgs, ... }:
{
  nix.enable = false; # Required for Determinate Nix Installer

  # Only truly system-wide tools here (optional)
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    gnupg
    # Add more if you want them for all users and system scripts
  ];

  services.tailscale.enable = true;
  system.stateVersion = 4;
}

