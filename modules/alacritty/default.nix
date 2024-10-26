{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
  };

  xdg.configFile."alacritty" = {
    source = ./alacritty;
    recursive = true;
  };
}
