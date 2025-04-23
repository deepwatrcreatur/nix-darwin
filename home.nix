{ config, pkgs, ... }:

{
  home.username = "deepwatrcreatur";
  home.homeDirectory = "/Users/deepwatrcreatur";
  home.stateVersion = "24.11";

  shellInit = ''
    set -x EDITOR hx
    set -x VISUAL hx
  '';

   users.users.${username} = {
    shell = pkgs.fish;
  };

  programs.fish = {
    shellAliases = {
      ls = "lsd"; # If you use lsd
      ll = "lsd -l";
      la = "lsd -a";
      lla = "lsd -la";
      ".." = "cd ..";
      update = "darwin-rebuild switch --flake $(home.homeDirectory)/nix-darwin-config/#$(hostname)"; # Example update alias
    enable = true; # Make sure fish is enabled in home-manager
    plugins = [
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish; }
      { name = "z"; src = pkgs.fishPlugins.z; } # Directory jumping
      { name = "puffer-fish"; src = pkgs.fishPlugins.puffer-fish; } # Text expansions
      { name = "autopair"; src = pkgs.fishPlugins.autopair; } # Autopair brackets/quotes
      { name = "grc"; src = pkgs.fishPlugins.grc; } # Colorize command output (needs grc package too)
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish; }
    ];

    interactiveShellInit = ''
      # === Bobthefish theme config ===
      # set -g theme_nerd_fonts yes # Set this if you have Nerd Fonts installed
      set -g theme_color_scheme solarized
      set -g theme_powerline_fonts no
      set -g theme_project_dir_length 1
      set -g theme_show_exit_status yes
      set -g theme_display_git_untracked yes

      # === Tide theme config (if using Tide) ===
      # Run 'tide configure' in your shell once, then copy the settings here
      # set -g tide_left_prompt_items (...)
      # set -g tide_right_prompt_items (...)
      # ... other tide settings ...

      # === Other plugin settings ===
      # set -g Z_SCRIPT_PATH ${pkgs.zoxide}/bin/zoxide # If using zoxide instead of fishPlugins.z
    '';

    # Add any packages needed by plugins (like grc, fzf, etc.)
    # fishPlugins.grc needs the core 'grc' package
    # fishPlugins.fzf-fish needs 'fzf'
  };

  # Make sure necessary tools are installed
  home.packages = [
    pkgs.fish
    pkgs.fzf # Needed by fzf-fish plugin
    pkgs.grc # Needed by grc plugin
    # pkgs.zoxide # Alternative to fishPlugins.z
    # pkgs.nerdfonts # If your theme requires it
    pkgs.lsd # Since you wanted this earlier
  ];


    };
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

