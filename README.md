# dotfiles 🏠

A portable environment for any 🍎 💻

### Examples

vim example
![work space example](./assets/pics/vim-example.png)

## Setup Iterm3

### Setting 🤓 Nerd Font ✒

```shell
iTerm2 -> Preferences -> Profiles -> Text -> Font -> Change Font
```

![set font](./assets/pics/change_font.png)

### Setting color theme

### Setting `onedark` color scheme

```shell
iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> onedark
```

![set colors](./assets/pics/set_colors.png)

## Install Custom ZSH Theme

[Spaceship theme 🚀](https://github.com/denysdovhan/spaceship-prompt)

#### Instructions

```shell
$ git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
$ ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

## Install Tmux Plugins

```shell
# Start a tmux session
$ tmux new -s setup

# Install plugins via tpm
$ ctrl-a + I
```

## Manuel Install (Apps not in homebrew)

| App                              | Description                            | Link                                                                                               |
| :------------------------------- | :------------------------------------- | :------------------------------------------------------------------------------------------------- |
| Gas Mask                         | Hosts file manager for macOS           | [github](https://github.com/2ndalpha/gasmask)                                                      |
| Google Play Music Desktop Player | 🎶 🎧                                  | [github](https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases) |
| Jitouch2                         | Magic gestures for 🍎 trackpad & mouse | [jitouch](https://www.jitouch.com/download/)                                                       |
| PSequel                          | PostgreSQL 🐘 client                   | [psequel](http://www.psequel.com/)                                                                 |
| Robomongo                        | MongoDB 🐵 client                      | [robomongo](https://robomongo.org/)                                                                |
| Tower                            | Git 🐱 client                          | [git-tower](https://www.git-tower.com/mac)                                                         |

## Import Alfred [Workflows](https://www.alfredapp.com/workflows/)

```shell
$ 7unzip ./assets/alfred_workflows.tar.7z
```

#### Drag and drop `*.alfredworkflow` into:

![import workflows](./assets/pics/import_workflows.png)

## Chrome Plugins

### Wasavi exrc

```vim
" exrc for wasavi

map! jj <ESC>
set writeas=textAndBreak
set theme=matrix
set jkdenotative

set number
set relativenumber

map <space>w :w<return>
map <space>ww :wq<return>

map H ^
map L $
```
