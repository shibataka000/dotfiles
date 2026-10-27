.DEFAULT_GOAL := install

PREREQUISITES := \
	$(HOME)/.claude/settings.json \
	$(HOME)/.claude/statusline.sh \
	$(HOME)/.config/gh/config.yml \
	$(HOME)/.config/herdr/config.toml \
	$(HOME)/.config/uv/uv.toml \
	$(HOME)/.copilot/hooks/notification.json \
	$(HOME)/.grip/settings.py \
	$(HOME)/.npmrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc \
	$(HOME)/snap/docker/current/.docker/cli-plugins/docker-rma

UBUNTU_DESKTOP_PREREQUISITES := $(if $(shell uname -r | grep -iv microsoft),\
	$(HOME)/.config/Code/User/keybindings.json \
	$(HOME)/.config/Code/User/settings.json \
	$(HOME)/.config/Code/User/tasks.json)

WSL_PREREQUISITES := $(if $(shell uname -r | grep -i microsoft),)

.PHONY: install
install: $(PREREQUISITES) $(UBUNTU_DESKTOP_PREREQUISITES) $(WSL_PREREQUISITES)

$(HOME)/.claude/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.claude/$(@F) $@

$(HOME)/.config/Code/User/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.vscode/$(@F) $@

$(HOME)/.config/gh/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.gh/$(@F) $@

$(HOME)/.config/herdr/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.herdr/$(@F) $@

$(HOME)/.config/uv/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.uv/$(@F) $@

$(HOME)/.copilot/hooks/%:
	mkdir -p $(@D)
	ln -s $(PWD)/.copilot/hooks/$(@F) $@

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
build: .copilot/bash_completion $(addprefix .kubectl-plugin-completion/kubectl_complete-,$(shell kubectl krew list | sed -e 's/-/_/') argo-rollouts)

.copilot/bash_completion: FORCE
	copilot completion bash > $@

.kubectl-plugin-completion/%:
	echo "#!/usr/bin/env sh\n$(shell echo $(@F) | sed -e 's/kubectl_complete-/kubectl-/') __complete \"\$$@\"" > $@
	chmod +x $@

.PHONY: clean
clean:
	rm .kubectl-plugin-completion/*

FORCE:
