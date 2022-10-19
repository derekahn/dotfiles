# dotfiles 🏠

A portable environment for any 🍎 💻

## Examples 📸

### Dashboard

![alpha](https://user-images.githubusercontent.com/5381156/196766122-8669cf89-a3c6-417c-a01a-b4ae62bddede.png)

### With Tmux

![tmux](https://user-images.githubusercontent.com/5381156/196766125-56ec796e-cd36-4238-b1f0-d0565091d2ab.png)

### Which-key

![Which-key](https://user-images.githubusercontent.com/5381156/196766124-ecce1e11-17d5-42c1-881b-99667ac85f3e.png)

### Spell Suggest

![spelling](https://user-images.githubusercontent.com/5381156/196766128-c89b51c4-a5fb-4e57-9c4f-778fe7526164.png)

### Buffer Explorer (ctrl-b)

![ctrl-b](https://user-images.githubusercontent.com/5381156/196766120-15913074-2e1c-44e5-9e38-ac725d54d609.png)

### Fuzzy Find (ctrl-f)

![ctrl-f](https://user-images.githubusercontent.com/5381156/196766117-ca5c88e3-9e12-4970-b88f-3a948ee56fa9.png)

## Setup Iterm2

### Setting 🤓 Nerd Font ✒

```shell
iTerm2 -> Preferences -> Profiles -> Text -> Font -> Change Font
```

### Setting up iterm colors

Download my preset colors

```bash
curl -L https://gist.githubusercontent.com/derekahn/fce4b5367006d10ca91a171d992999e0/raw/711122aca2f603339d1acc734bef88b2f6f018a3/onedark.itermcolors -o ~/Documents/onedark.itermcolors
```

Import the preset colors into iTerm2

```shell
iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> Import...
```

Select the preset color `onedark`

```shell
iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets... -> onedark
```

### Setting up iterm status bar

```shell
iTerm2 -> Preferences > Profiles > Session
```

- Turn on `Status bar enabled` at the bottom right pane
- Then click Configure Status Bar to begin setting up your status bar configuration

```shell
iTerm2 -> Preferences > Appearance > General
```

- `Status bar location` is the third key

### Setting up rectangle

```bash
curl -L https://gist.githubusercontent.com/derekahn/57717fa5301d24bcfb888a58178f5ab1/raw/35b0e55a5315449cf64abee40ba3c3cd37291c75/RectangleConfig.json -o ~/Documents/RectangleConfig.json
```

![Rectangle Config](https://user-images.githubusercontent.com/5381156/196766181-fe51ad11-7767-4cec-9847-13958f41cfc9.png)
