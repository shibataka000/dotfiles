# dotfiles

## Install

```bash
DOTFILES=/path/to/dotfiles

# bashrc
echo ". $DOTFILES/.bashrc" >> $HOME/.bashrc

# emacs
ln -s $DOTFILES/init.el $HOME/.emacs.d/init.el

# xkbcomp
ln -s $DOTFILES/xkb $HOME/.xkb
ln -s $DOTFILES/xkbcomp.sh.desktop $HOME/.config/autostart/xkbcomp.sh.desktop
echo ". $HOME/.xkb/xkbcomp.sh" >> $HOME/.bashrc
```

## Author

[shibataka000](https://github.com/shibataka000)
