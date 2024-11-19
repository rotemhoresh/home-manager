{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = false;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant "moon"

          set -g @rose_pine_window_status_separator "  "
          set -g @rose_pine_bar_bg_disable "on"
          set -g @rose_pine_disable_active_window_menu "on"
        '';
      }
    ];
    prefix = "C-t";
  };
  #
  # xdg.configFile.".tmux" = {
  #   source = ./tmux;
  #   recursive = true;
  # };
}
