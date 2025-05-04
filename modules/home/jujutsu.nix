{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ jujutsu helix ];

  xdg.configFile."jj/config.toml".text = ''
    user = { name = "Anwer Khan", email = "deepwatrcreatur@gmail.com" }
    editor = "hx"
  '';
}

