# dotfiles

Dotfiles for Mac computer. 

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
* To the file `~/.zshenv` (Create one if not present already) add this line:
```
ZDOTDIR=~/.config/zsh
```
