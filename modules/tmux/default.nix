{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      rose-pine
    ];
  };

  xdg.configFile."tmux" = {
    source = ./tmux;
    recursive = true;
  };
}
