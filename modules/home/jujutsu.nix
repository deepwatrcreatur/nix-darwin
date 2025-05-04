{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ jujutsu helix ];

  xdg.configFile."jj/config.toml".text = ''
    user = { name = "Your Name", email = "your@email.com" }
    editor = "hx"
  '';
}

