{
packageOverrides = pkgs: {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = with pkgs; [
      yt-dlp
      helix
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
      rclone
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
      ];
    };
  };
}
