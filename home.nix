{
  nixgl,
  ...
}:

{
  imports = [
    ./modules
    ./packages.nix
    ./env.nix
  ];

  nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
  };

  home.username = "rotemhoresh";
  home.homeDirectory = "/home/rotemhoresh";

  home.stateVersion = "24.05"; # DON'T CHANGE (unless you know what you're doing...)

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
