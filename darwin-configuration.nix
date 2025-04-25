{ config, pkgs, ... }:
{
  nix.enable = false; # Required for Determinate Nix Installer

  # System-level packages and services (optional, but won't be in user PATH)
  environment.systemPackages = with pkgs; [
    # Only truly system-wide tools here, if any
    git
    curl
    wget
    # ...etc...
  ];

  services.tailscale.enable = true;
  system.stateVersion = 4;
}

