{ config, pkgs, ... }:

{
  home.username = "deepwatrcreatur";
  home.homeDirectory = "/Users/deepwatrcreatur";
  home.stateVersion = "24.11";

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # Nix language servers
      nil
      nixd
      nixfmt
      
      # Elixir language server
      elixir-ls
    ];

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "nixfmt"; };
          language-servers = [ "nil" "nixd" ];
        }
        {
          name = "elixir";
          auto-format = true;
          language-servers = [ "elixir-ls" ];
        }
      ];

      language-server = {
        nil = {
          command = "nil";
          config.nil = {
            formatting.command = [ "nixfmt" ];
          };
        };
        
        nixd = {
          command = "nixd";
        };
        
        elixir-ls = {
          command = "elixir-ls";
        };
      };
    };

    settings = {
      theme = "gruvbox";
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };
  };

  # Add Elixir and Erlang to your PATH
  home.packages = with pkgs; [
    elixir
    erlang
  ];
}

