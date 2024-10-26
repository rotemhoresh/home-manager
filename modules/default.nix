{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./git.nix
    ./wofi
    ./hyprland
    ./neovim
    ./alacritty
  ];

  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # lsp
    nixd

    # formatters
    nixfmt-rfc-style

    # shells
    bash
    zsh

    # programming languages
    go
    python3
    lua
  ];
}
