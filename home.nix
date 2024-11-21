{
  pkgs,
  nixgl,
  ...
}:

{
  imports = [
    ./modules
    ./files
    ./env.nix
  ];

  # nixGL = {
  #   packages = nixgl.packages;
  #   defaultWrapper = "mesa";
  # };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.username = "rotemhoresh";
  home.homeDirectory = "/home/rotemhoresh";

  home.stateVersion = "24.05"; # DON'T CHANGE (unless you know what you're doing...)

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
