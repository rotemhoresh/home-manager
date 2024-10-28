{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."oh-my-posh" = {
    source = ./oh-my-posh;
    recursive = true;
  };
}
