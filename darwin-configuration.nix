# ~/nix-darwin/darwin-configuration.nix
{
  config,
  pkgs,
  home-manager,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    yt-dlp
    glow
    rclone
    git
    gh
    bash
    python3
    kitty
    nano
    neovim
    chezmoi
    stow
    gnupg
    fastfetch
    elixir
    erlang
    mix2nix
    iperf3
    htop
    btop
    fzf
    bat
    wget
    curl
    nmap
    tmux
    ffmpeg
    libuv
    lz4
    lzo
    sqlite
    starship
    watch
  ];

  imports = [
    home-manager.darwinModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.deepwatrcreatur = { pkgs, ... }: {
    home.stateVersion = "23.11";
    home.homeDirectory = "/Users/deepwatrcreatur"; # Add this line
    programs.helix = {
      enable = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        nil
        nixfmt
      ];

      languages = {
        language = [{
          name = "nix";
          auto-format = true;
          language-servers = [ "nil" ];
        }];

        language-server.nil = {
          command = "nil";
        };
      };

      settings = {
        theme = "gruvbox";
        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };

  system.stateVersion = 4;
}
