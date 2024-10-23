{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
  ];

  home.packages = with pkgs; [
    # LSP
    nixd

    # Formatters
    nixfmt-rfc-style
  ];
}
