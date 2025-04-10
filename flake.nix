# ~/nix-darwin/flake.nix
{
  description = "My nix-darwin configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin"; # For Apple Silicon (M4)
  in
  {
    darwinConfigurations.macminim4 = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [
        ./darwin-configuration.nix  # Ensure this matches the exact filename
        home-manager.darwinModules.home-manager
        {
          nixpkgs.hostPlatform = system;
          nix.settings.experimental-features = "nix-command flakes";
          nix.enable = false; # For Determinate Nix
          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 4;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
  };
}
