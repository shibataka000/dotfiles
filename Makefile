.DEFAULT_GOAL := install

INSTALL_TARGETS := \
	$(HOME)/.config/gh/config.yml \
	$(HOME)/.config/starship.toml \
	$(HOME)/.config/uv/uv.toml \
	$(HOME)/.grip/settings.py \
	$(HOME)/.npmrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc \
	$(HOME)/snap/docker/current/.docker/cli-plugins/docker-rma

INSTALL_TARGETS_FOR_UBUNTU_DESKTOP := $(if $(shell uname -r | grep -iv microsoft),\
	$(HOME)/.claude/settings.json \
	$(HOME)/.claude/statusline.sh \
	$(HOME)/.codex/config.toml \
	$(HOME)/.config/Code/User/keybindings.json \
	$(HOME)/.config/Code/User/settings.json \
	$(HOME)/.config/Code/User/tasks.json \
	$(HOME)/.copilot/settings.json)

INSTALL_TARGETS_FOR_WSL := $(if $(shell uname -r | grep -i microsoft),)

.PHONY: install
install: $(INSTALL_TARGETS) $(INSTALL_TARGETS_FPR_UBUNTU_DESKTOP) $(INSTALL_TARGETS_FOR_WSL)

$(HOME)/%:
	mkdir -p $(@D)
	ln -s $(PWD)/$* $@

$(HOME)/snap/docker/current/.docker/cli-plugins/%: snap/docker/current/.docker/cli-plugins/%
	mkdir -p $(@D)
	cp $(PWD)/$< $@
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
	rm .kubectl-plugin-completion/*

FORCE:
