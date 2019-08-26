# dotfiles

## Install

```bash
DOTFILES=/path/to/dotfiles

# bashrc
echo ". $DOTFILES/.bashrc" >> $HOME/.bashrc

# emacs
ln -s $DOTFILES/.emacs.d/init.el $HOME/.emacs.d/init.el

# vscode
ln -s $DOTFILES/.code/settings.json $HOME/.config/Code/User/settings.json
```

## Author

[shibataka000](https://github.com/shibataka000)
