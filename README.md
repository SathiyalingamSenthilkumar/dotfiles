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
* Some plugins are dependent on emojis being installed (For example, LSPSaga uses light bulb emoji, which is provided by noto-fonts-emoji package).
* The lazygit plugin requires [lazygit](https://github.com/jesseduffield/lazygit) to be installed.


### sway
* Install sway together with swayidle and swaylock, which sway only suggests
  (package names as on Ubuntu/Debian):
```
sudo apt install sway swayidle swaylock
```
* The screen locks after 10 minutes of inactivity and before suspend, and
  manually with `$mod+Escape`.
* lxpolkit shows the password prompt when an app asks for admin rights.
* The area screenshot binding (`$mod+p`) needs grim, slurp and wl-clipboard.
* The status bar is waybar, its config needs:
    * fonts-font-awesome - Icons.
    * pavucontrol - Opened by clicking on the volume.
    * power-profiles-daemon - Power profile module.
* kanshi arranges the screens per desk. The profiles in `kanshi/config` match
  the monitors by make, model and serial, so adjust them for other monitors
  (get the names with `swaymsg -t get_outputs`).
* The lock screen options are in `swaylock/config`.
* Notifications are shown by sway-notification-center (swaync), its style is in
  `swaync/style.css`.
* The launcher (`$mod+r`) is rofi, its theme is in `rofi/config.rasi`.

### awesome
* The config has dependencies on following packages:
    * picom - Compositor for Xorg.
    * nitrogen - Desktop background setter for X-Window.
    * apcid - Battery widget (look into submodule battery-widget).
