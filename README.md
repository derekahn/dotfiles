# dotfiles 🏠

A portable environment for any 🍎 💻

![example](https://i.imgur.com/1FAZCUy.png)

## Setup Iterm2

### Setting 🤓 Nerd Font ✒

```shell
iTerm2 -> Preferences -> Profiles -> Text -> Font -> Change Font
```

### Setting up iterm colors

Download my preset colors

```bash
curl -L https://gist.github.com/derekahn/fce4b5367006d10ca91a171d992999e0 -o ~/Documents/onedark.itermcolors
```

Import the preset colors into iTerm2

```shell
iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> Import...
```

Select the preset color `onedark`

```shell
iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> onedark
```

## Install Tmux Plugins

```shell
# Start a tmux session
$ tmux new -s setup

# Install plugins via tpm
$ ctrl-a + I
```

## Manuel Install (Apps not in homebrew)

| App       | Description                            | Link                                         |
| :-------- | :------------------------------------- | :------------------------------------------- |
| Jitouch2  | Magic gestures for 🍎 trackpad & mouse | [jitouch](https://www.jitouch.com/download/) |
| PSequel   | PostgreSQL 🐘 client                   | [psequel](http://www.psequel.com/)           |
| Robomongo | MongoDB 🐵 client                      | [robomongo](https://robomongo.org/)          |
