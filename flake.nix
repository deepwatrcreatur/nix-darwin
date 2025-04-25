{
  description = "My nix-darwin configuration with Home Manager";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
    in {
      darwinConfigurations.macminim4 = nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin-configuration.nix
        ];
      };
      homeConfigurations."deepwatrcreatur" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [ ./home.nix ];
      };
    };
}

