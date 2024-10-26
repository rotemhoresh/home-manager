{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.firefox;
  };
}
