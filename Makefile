.DEFAULT_GOAL := install

.PHONY: install
install: $(HOME)/.bash_aliases $(HOME)/.bash_completion $(HOME)/.config/Code/User/settings.json $(HOME)/.config/Code/User/keybindings.json $(HOME)/.config/Code/User/tasks.json $(HOME)/.config/gh/config.yml $(HOME)/.grip/settings.py $(HOME)/.tmux.conf $(HOME)/.vimrc

$(HOME)/.bash_%:
	ln -s $(PWD)/.bash/$(@F) $@

$(HOME)/.config/Code/User/%:
	ln -s $(PWD)/.code/$(@F) $@

$(HOME)/.config/gh/config.yml:
	ln -s $(PWD)/.gh/config.yml $@

$(HOME)/.grip/settings.py:
	ln -s $(PWD)/.grip/settings.py $@

$(HOME)/.tmux.conf:
	ln -s $(PWD)/.tmux.conf $@

$(HOME)/.vimrc:
	ln -s $(PWD)/.vimrc $@
