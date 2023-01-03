# dotfiles

Dotfiles for Unix/Linux environment.

## Setting up the configuration

Clone the repo in the desired directory:

```
git clone git@github.com:SathiyalingamSenthilkumar/dotfiles.git
```

Run the install.sh script that creates the symbolic links in the `~/.config/` directory:
```
bash install.sh
```

## Requirements

### kitty
* The terminal emulator kitty should be installed.

### zsh
* The path for custom `.zshrc` file should be specified.
* Add the following line to `~/.zshenv` file:
```
ZDOTDIR=~/.config/zsh
```
### neovim
* Telescope needs [ripgrep](https://github.com/BurntSushi/ripgrep) to be installed.
* The clipboard utility of neovim is platform dependent, as neovim uses different clipboard tools on different platforms. The help for clipboard `:h clipboard` describes the clipboard tool needed for each platform.
* Run `:checkhealth` on neovim to verify the working condition of different utilities.


### awesome
* The config has dependencies on following packages:
    * picom - Compositor for Xorg.
    * nitrogen - Desktop background setter for X-Window.
    * apcid - Battery widget (look into submodule battery-widget).
