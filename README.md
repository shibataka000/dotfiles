# dotfiles

## Install
```bash
DOTFILES=/path/to/dotfiles

# bashrc
echo ". $DOTFILES/.bash/.bashrc" >> $HOME/.bashrc
ln -s $DOTFILES/.bash/.bash_aliases >> $HOME/.bash_aliases
ln -s $DOTFILES/.bash/.bash_completion >> $HOME/.bash_completion

# vim
ln -s $DOTFILES/.vimrc $HOME/.vimrc

# tmux
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

# vscode
ln -s $DOTFILES/.code/settings.json $HOME/.config/Code/User/settings.json
ln -s $DOTFILES/.code/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $DOTFILES/.code/tasks.json $HOME/.config/Code/User/tasks.json

# grip
ln -s $DOTFILES/.grip/settings.py $HOME/.grip/settings.py

# gh
ln -s $DOTFILES/.gh/config.yml $HOME/.config/gh/config.yml 

# git
$ cat <<EOF >> $HOME/.gitconfig
[include]
	path = $DOTFILES/.gitconfig
EOF
```
