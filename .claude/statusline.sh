#!/bin/bash

monthly=$(ccusage monthly --json --offline --order desc | jq -r '.monthly[0].totalCost * 100 | round / 100')
echo "$(cat | ccusage statusline) | 💰 \$${monthly} monthly"
