{ config, pkgs, ... }:

{
  home.username = "deepwatrcreatur";
  home.homeDirectory = "/Users/deepwatrcreatur";
  home.stateVersion = "24.11";

  # Add packages to your PATH
  home.packages = with pkgs; [
    # Development tools
    # Other utilities you might want
    ripgrep
    fd
    jq
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # Nix language servers
      nil
      nixd
      nixfmt-classic  # Use the classic version explicitly
      
      # Elixir language server
      elixir-ls
    ];

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "nixfmt-classic"; };
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
            formatting.command = [ "nixfmt-classic" ];
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
}

