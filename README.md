# Neovim configs

## Needed programs

```sh
brew install iterm2
brew install neovim
brew install ripgrep
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
˜
(as long as you installed all these plugins you can follow bellow steps)

### Show/Hide Left side bar

- control + n (^N) Create

### Create a file

- seek for a directory you want to
- press a
- it will show at the bottom the path to add the file

### Rename a file
- place cursor on it 
- press r (simple r)

### Move a chunk of code up and down 
- select the chunk
- to move up: shit k (capital K)
- to move down: shift j (capital J)

### Delete a Line

### Deleting multiple lines

### Switching from left sidebar to code are

### Handling multiple tabs 
- by using barbar plugin, all opened file will be placed into a tab 
- to move to an specific tab : "Space" + tab number 
- to close the current tab : "space "+ c 
- to move left : "Space"+>
- to move right; "Space"+<

### Spliting the screen vertically
- control + s (will split in to areas)
- to move left: control + l 
- to move right: control + h 
- to close current vertical window: control + q 

### Debbugging

- go to the line you want to debug
- press esc if needed
- press `" "bp` to add a break point
- to run, go to the main and run `" "de`

## References

- https://www.youtube.com/watch?v=U-omALWIBos
- https://www.youtube.com/watch?v=-ONbfnVc_v8
