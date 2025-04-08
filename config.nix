# config.nix
let
  pkgs = import <nixpkgs> {};
in
{
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
  };
}
