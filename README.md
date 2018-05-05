# dotfiles

## Install

```bash
DOTFILES=/path/to/dotfiles

# bashrc
echo ". $DOTFILES/.bashrc" >> $HOME/.bashrc

# emacs
ln -s $DOTFILES/.emacs.d/init.el $HOME/.emacs.d/init.el

# xkbcomp
ln -s $DOTFILES/.xkb $HOME/.xkb
ln -s $HOME/.xkb/xkbcomp.desktop $HOME/.config/autostart/xkbcomp.desktop
echo ". $HOME/.xkb/xkbcomp.sh" >> $HOME/.bashrc
```

## Author

[shibataka000](https://github.com/shibataka000)
