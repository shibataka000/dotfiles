.DEFAULT_GOAL := build

.PHONY: build
build: $(foreach plugin,$(shell kubectl krew list | sed -e 's/-/_/'),kubectl_complete-$(plugin)) kubectl_complete-argo-rollouts

kubectl_complete-%:
	echo "#!/usr/bin/env sh\n$(shell echo $@ | sed -e 's/kubectl_complete-/kubectl-/') __complete \"\$$@\"" > $@
	chmod +x $@

.PHONY: clean
clean:
	rm kubectl_complete-*
