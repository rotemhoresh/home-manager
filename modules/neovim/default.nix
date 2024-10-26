{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
