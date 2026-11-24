.DEFAULT_GOAL := install

INSTALL_TARGETS := \
	$(HOME)/.claude/settings.json \
	$(HOME)/.codex/config.toml \
	$(HOME)/.config/gh/config.yml \
	$(HOME)/.config/starship.toml \
	$(HOME)/.config/tmux/tmux.conf \
	$(HOME)/.config/uv/uv.toml \
	$(HOME)/.copilot/hooks/notify-send.json \
	$(HOME)/.copilot/settings.json \
	$(HOME)/.grip/settings.py \
	$(HOME)/.npmrc \
	$(HOME)/.textlintrc \
	$(HOME)/.vimrc \
	$(HOME)/snap/docker/current/.docker/cli-plugins/docker-rma

INSTALL_TARGETS_FOR_UBUNTU_DESKTOP := $(if $(shell uname -r | grep -iv microsoft),\
	$(HOME)/.config/Code/User/keybindings.json \
	$(HOME)/.config/Code/User/settings.json \
	$(HOME)/.config/Code/User/tasks.json)

INSTALL_TARGETS_FOR_WSL := $(if $(shell uname -r | grep -i microsoft),\
	$(HOME)/.vscode-server/data/Machine/settings.json)

.PHONY: install
install: $(INSTALL_TARGETS) $(INSTALL_TARGETS_FOR_UBUNTU_DESKTOP) $(INSTALL_TARGETS_FOR_WSL)

$(HOME)/%: %
	mkdir -p $(@D)
	ln -s $(realpath $<) $@

$(HOME)/snap/docker/current/.docker/cli-plugins/%: snap/docker/current/.docker/cli-plugins/%
	mkdir -p $(@D)
	cp $< $@
	chmod +x $@

.PHONY: build
build: .copilot/completion.bash $(addprefix .kubectl-plugin-completion/kubectl_complete-,$(shell kubectl krew list) argo-rollouts)

.copilot/completion.bash: FORCE
	copilot completion bash > $@

.kubectl-plugin-completion/%:
	echo "#!/usr/bin/env sh\n$(shell echo $(@F) | sed -e 's/kubectl_complete-/kubectl-/') __complete \"\$$@\"" > $@
	chmod +x $@

.PHONY: clean
clean:
	$(RM) .kubectl-plugin-completion/*

FORCE:
