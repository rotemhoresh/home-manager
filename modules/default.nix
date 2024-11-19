{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./git.nix
    ./tmux
    ./wofi
    ./hyprland
    ./neovim
    ./alacritty
    ./oh-my-posh
    # ./kanata
  ];

  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # apps
    obsidian
    spotify
    thunderbird
    virtualbox

    # lsp
    nixd

    # formatters
    nixfmt-rfc-style

    # shells
    bash
    zsh

    # cli
    neofetch
    zoxide

    # programming languages
    go
    python313
    lua
  ];
}
