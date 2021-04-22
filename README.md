# dotfiles
## init.vim
### Prerequisite
- neovim
```shell
brew install neovim
```
- vi-plug
```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### Usage
1. Link `init.vim` file.
```shell
cd $HOME/.config/nvim
ln -sf $dotfiles/init.vim ./
```
2. Open 'vim' editor
3. Install plugins
```vim
:PlugInstall
<C-s>
```

### Usage for plugins
#### NERDTree
https://github.com/preservim/nerdtree \
`<C-o>`  open NERDTree (keymapping) \
`<C-h>`  move cursor to NERDTree \
`<C-l>`  move cursor to vim \
`<C-I>`  show hiden file
#### multi-cursor
https://github.com/terryma/vim-multiple-cursors \
`<C-n>`  start multi-cursor and select the word on the cursor \
`<C-n>`  select the next word \
`<C-x>`  skip the next word \
`<C-p>`  move to the previous word \
`<A-n>`  start multi-cursor and select all words \
 \
`<S-v> <C-n> i <esc>`  select visual block, start multi-cursor, start insert, and end
#### split
`:sp`    horizontal split \
`:vsp`   vert split \
`<C-h,j,k,l>` navigate between splited plains
#### CtrlP
https://github.com/ctrlpvim/ctrlp.vim \
`<C-p>`   open finder
`<C-j,k>` navigate

### Miscellaneous
If you want to yank into clipboard, use visual block (`<S-v>`), select area, use command `"+y`. 
If this deos not work in SSH session, you should install `xsel` (http://www.vergenet.net/~conrad/software/xsel/#download).


## tmux
### Prerequisite
- tmux
```shell
brew install tmux
```
- tpm
tmux plugin manager
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
### Usage
1. Link `tmux.conf` file. Notice `.`, a hiden file.
```shell
cd $HOME
ln -sf $dotfiles/tmux.conf .tmux.conf
```
2. Open `tmux` session
```shell
tmux
```
3. Install tpm \
`prefix + I` (capital i) \
`prefix` will be `<C-a>` (`<C-b>` is default). Install window will show up in seconds and plugins will be installed.
4. Reload `tmux` \
`prefix + <C-s>`
