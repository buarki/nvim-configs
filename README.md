# Neovim configs

## Needed programs

```sh
brew install iterm2
brew install neovim
rew install ripgrep
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
go install github.com/go-delve/delve/cmd/dlv@latest
```

Configure tmux.conf:

```sh

```

## Needed fonts

- I'm using Meslo, just download it from [here](https://www.nerdfonts.com/font-downloads);
- Once downloaded, add to `Libary/Fonts`:

```sh
mv Downloads/Meslo/*.ttf Library/Fonts
```

- Open item2;
- Click Profiles -> Open Profiles -> Select Default -> Edit Profile -> Text -> At Fonts dropdown menu select `MesloLGL Nerd Font`;

## Practical straightford quick and straight to the point Nvim 1:1

(as long as you installed all these plugins you can follow bellow steps)

### Show/Hide Left side bar

- control + n (^N) Create

### Create a file

- seek for a directory you want to
- press a
- it will show at the bottom the path to add the file

### Delete a Line

### Deleting multiple lines

### Switching from left sidebar to code are

### Open muliple code areas

### Debbugging

- go to the line you want to debug
- press esc if needed
- press `" "bp` to add a break point
- to run, go to the main and run `" "de`

## References

- https://www.youtube.com/watch?v=U-omALWIBos
- https://www.youtube.com/watch?v=-ONbfnVc_v8
