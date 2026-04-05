.DEFAULT_GOAL := install

.PHONY: install
install: \
	$(HOME)/.bash_aliases \
	$(HOME)/.bash_completion \
	$(HOME)/.claude/settings.json \
	$(HOME)/.claude/statusline.sh \
	$(HOME)/.config/Code/User/keybindings.json \
	$(HOME)/.config/Code/User/settings.json \
	$(HOME)/.config/Code/User/tasks.json \
	$(HOME)/.config/gh/config.yml \
	$(HOME)/.config/uv/uv.toml \
	$(HOME)/.copilot/copilot-instructions.md \
	$(HOME)/.copilot/mcp-config.json \
	$(HOME)/.copilot/skills \
	$(HOME)/.grip/settings.py \
	$(HOME)/.npmrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc

$(HOME)/.bash_%:
	ln -s $(PWD)/.bash/$(@F) $@

$(HOME)/.claude/%:
	ln -s $(PWD)/.claude/$(@F) $@

$(HOME)/.config/Code/User/%:
	ln -s $(PWD)/.vscode/$(@F) $@

$(HOME)/.config/gh/%:
	ln -s $(PWD)/.gh/$(@F) $@

$(HOME)/.config/uv/%:
	ln -s $(PWD)/.uv/$(@F) $@

$(HOME)/.copilot/%:
	ln -s $(PWD)/.copilot/$(@F) $@

$(HOME)/.grip/%:
	ln -s $(PWD)/.grip/$(@F) $@

$(HOME)/.npmrc:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.tmux.conf:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.vimrc:
	ln -s $(PWD)/$(@F) $@
