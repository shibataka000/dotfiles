#!/bin/bash

statusline="$(cat | ccusage statusline)"
monthlycost=$(ccusage monthly --json --offline --order desc | jq -r '.monthly[0].totalCost * 100 | round / 100')
echo "${statusline} | 💰 \$${monthlycost} monthly"
