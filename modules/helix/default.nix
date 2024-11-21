{
  programs.helix = {
    enable = true;
  };

  xdg.configFile."helix" = {
    source = ./helix;
    recursive = true;
  };
}
