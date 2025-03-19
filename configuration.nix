{ config, pkgs, lib, ... }:

{
  # System-level configuration
  nix = {
    package = pkgs.nixVersions.stable; # Use Nix with flakes support
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # Define your hostname
  networking.hostName = "macminim4";

  nix.enable = false;

  # Enable nix-darwin to manage system services
  # services.nix-daemon.enable = true; 

  # Time zone
  time.timeZone = "America/Toronto"; # Adjust to your timezone

  # Enable some common macOS-specific settings
  system = {
    # Keyboard settings
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = false; # Optional: remap Caps Lock to Control
    };

    # Default shell
    defaults = {
      dock.autohide = false; # Autohide the dock
      finder.AppleShowAllExtensions = true; # Show all file extensions
      NSGlobalDomain.AppleShowAllExtensions = true;
    };

    # Activation scripts (run on system activation)
    activationScripts.postActivation.text = ''
      # Ensure Homebrew is not in PATH (optional, if you want pure Nix)
      #/usr/bin/chflags nohidden /Users/yourUsername/.nix-profile
    '';
  };

  # Fonts (optional)
  fonts = {
    packages = with pkgs; [
     pkgs.nerd-fonts.fira-code
     pkgs.nerd-fonts.jetbrains-mono
    ];
  };

  # Users
  users.users.deepwatrcreatur = {
    name = "Anwer Khan";
    home = "/Users/deepwatrcreatur";
    shell = pkgs.zsh; # Or your preferred shell
  };

  # Enable Zsh as the default shell
  programs.zsh.enable = true;

  # Allow unfree packages (e.g., for proprietary software)
  nixpkgs.config.allowUnfree = true;

  # System state version (adjust based on your needs)
  system.stateVersion = 6;
}
