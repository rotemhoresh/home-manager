{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kanata
  ];

  xdg.configFile."kanata" = {
    source = ./kanata;
    recursive = true;
  };
}
