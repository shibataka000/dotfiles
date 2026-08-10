#!/bin/bash

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
