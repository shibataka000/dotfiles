#!/bin/bash
for plugin in $(kubectl krew list) "argo rollouts"
do
    kubectl_plugin="kubectl-$(echo $plugin | sed -e 's/-/_/' -e 's/ /-/')"
    kubectl_plugin_completion="kubectl_complete-$(echo $plugin | sed -e 's/-/_/' -e 's/ /-/')"

    $kubectl_plugin __complete "" > /dev/null 2>&1
    if [ $? == 0 ]; then
        echo "#!/usr/bin/env sh" > $kubectl_plugin_completion
        echo "$kubectl_plugin __complete \"\$@\"" >> $kubectl_plugin_completion
        chmod +x $kubectl_plugin_completion
        echo "Plugin completion for $kubectl_plugin is generated."
    else
        echo "Plugin completion for $kubectl_plugin is NOT generated."
    fi
done
