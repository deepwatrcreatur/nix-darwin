{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.helix;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixd
      nixpkgs-fmt
      elixir-ls
    ];
    settings = import ../../helix-settings.nix;
    languages = import ../../helix-languages.nix { inherit pkgs; };
  };
}

