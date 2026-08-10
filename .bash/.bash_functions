#!/bin/bash

# Compare manifests built by kustomize from two different references in a github repository.
function kdiff() {
    if [ $# -ne 3 ]; then
        echo "Usage: kdiff <url> <ref1> <ref2>"
        return 1
    fi

    KUSTOMIZE_BUILD="kustomize build --enable-alpha-plugins"
    echo "$ diff <(${KUSTOMIZE_BUILD} ${1}?ref=${2}) <(${KUSTOMIZE_BUILD} ${1}?ref=${3})"
    diff -u -N --color=auto <(${KUSTOMIZE_BUILD} "${1}?ref=${2}") <(${KUSTOMIZE_BUILD} "${1}?ref=${3}")
}

# Retrieve the JSON execution plan from HCP Terraform.
# https://developer.hashicorp.com/terraform/cloud-docs/api-docs/plans#retrieve-the-json-execution-plan
function tfctl-retrieve-json-execution-plan() {
    if [ $# -ne 1 ]; then
        echo "Usage: retrieve-hcp-terraform-json-execution-plan <id>"
        return 1
    fi

    TOKEN=$(jq -r '.credentials["app.terraform.io"].token' "${HOME}/.terraform.d/credentials.tfrc.json")
    curl -s --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --location "https://app.terraform.io/api/v2/runs/${1}/plan/json-output" | jq .
}
