# dotfiles

## Install
```bash
# Make symbolic links.
make install

# Update bashrc.
echo ". $(pwd)/.bash/.bashrc" >> ${HOME}/.bashrc

# Update gitconfig.
$ cat <<EOF >> ${HOME}/.gitconfig
[include]
	path = $(pwd)/.gitconfig
EOF
```
