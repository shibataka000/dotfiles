# dotfiles

## Install

```bash
DOTFILES=/path/to/dotfiles

# bashrc
echo ". $DOTFILES/.bashrc" >> $HOME/.bashrc

# emacs
ln -s $DOTFILES/.emacs.d/init.el $HOME/.emacs.d/init.el

# vim
ln -s $DOTFILES/.vimrc $HOME/.vimrc

# tmux
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

# vscode
ln -s $DOTFILES/.code/settings.json $HOME/.config/Code/User/settings.json
ln -s $DOTFILES/.code/keybindings.json $HOME/.config/Code/User/keybindings.json

# grip
cp $DOTFILES/.grip/settings.py $HOME/.grip/settings.py
```

## Author

[shibataka000](https://github.com/shibataka000)
