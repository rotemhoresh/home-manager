# home-manager config

## Requirments

### Nix

[Nix package manager](https://nixos.org/download/)

```bash
# single user installation
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

### Home Manager

[Standalone Home Manager with Flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

Add the following to nix.conf (located at ~/.config/nix/).

```conf
experimental-features = nix-command flakes
```

TODO: install without creating a boilerplate config.

## Installation

Clone this repository to `~/.config`:

```bash
cd ~/.config
git clone git@github.com:rotemhoresh/home-manager.git
```

Activate the home manager configuration:

```bash
home-manager switch
```
