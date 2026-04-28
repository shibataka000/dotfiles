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
	$(HOME)/.grip/settings.py \
	$(HOME)/.npmrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc \
	$(HOME)/snap/docker/current/.docker/cli-plugins/docker-rma

$(HOME)/.bash_%:
	ln -s $(PWD)/.bash/$(@F) $@

$(HOME)/.claude/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.claude/$(@F) $@

$(HOME)/.config/Code/User/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.vscode/$(@F) $@

$(HOME)/.config/gh/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.gh/$(@F) $@

$(HOME)/.config/uv/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.uv/$(@F) $@

$(HOME)/.copilot/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.copilot/$(@F) $@

$(HOME)/.grip/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.grip/$(@F) $@

$(HOME)/.npmrc:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.tmux.conf:
	ln -s $(PWD)/$(@F) $@

$(HOME)/.vimrc:
	ln -s $(PWD)/$(@F) $@

$(HOME)/snap/docker/current/.docker/cli-plugins/%: .docker/cli-plugins/%
	mkdir -p $(@D)
	cp $(PWD)/.docker/cli-plugins/$(@F) $@
	chmod +x $@

.PHONY: build
build: .copilot/bash_completion

.copilot/bash_completion: FORCE
	copilot completion bash > $@

FORCE:
