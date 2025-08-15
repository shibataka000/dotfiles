.DEFAULT_GOAL := install

.PHONY: install
install: $(HOME)/.bash_aliases $(HOME)/.bash_completion $(HOME)/.config/Code/User/settings.json $(HOME)/.config/Code/User/keybindings.json $(HOME)/.config/Code/User/tasks.json $(HOME)/.config/gh/config.yml $(HOME)/.grip/settings.py $(HOME)/.tmux.conf $(HOME)/.vimrc $(HOME)/.claude/settings.json $(HOME)/.claude/statusline.sh

$(HOME)/.bash_%:
	ln -s $(PWD)/.bash/$(@F) $@

$(HOME)/.config/Code/User/%:
	ln -s $(PWD)/.vscode/$(@F) $@

$(HOME)/.config/gh/config.yml:
	ln -s $(PWD)/.gh/$(@F) $@

$(HOME)/.grip/settings.py:
	ln -s $(PWD)/.grip/$(@F) $@

$(HOME)/.tmux.conf:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.vimrc:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.claude/settings.json:
	ln -s $(PWD)/.claude/$(@F) $@

$(HOME)/.claude/statusline.sh:
	ln -s $(PWD)/.claude/$(@F) $@
