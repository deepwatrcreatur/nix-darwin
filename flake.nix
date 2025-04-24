# flake.nix (Simplified)
{
  description = "My nix-darwin configuration with Home Manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # Use the standard signature, only listing defined inputs and self
  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin"; # For Apple Silicon (M4)
  in
  {
    darwinConfigurations.macminim4 = nix-darwin.lib.darwinSystem {
      inherit system;
      # Remove specialArgs unless a module explicitly needs the 'inputs' set
      # specialArgs = { inherit inputs; }; # REMOVED THIS LINE
      modules = [
        # Your existing system configuration
        ./darwin-configuration.nix

        # --- Add Home Manager Integration ---
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.deepwatrcreatur = import ./home.nix;
            # Remove extraSpecialArgs unless home.nix explicitly needs 'inputs'
            # extraSpecialArgs = { inherit inputs; }; # REMOVED THIS LINE
          };
        }
        # --- End Home Manager Integration ---
      ];
    };
    # No separate homeConfigurations block needed
  };
}

