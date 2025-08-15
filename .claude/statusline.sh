#!/bin/bash

dailycost=$(ccusage daily --json --offline --order desc | jq -r '.daily[0].totalCost * 100 | round / 100')
monthlycost=$(ccusage monthly --json --offline --order desc | jq -r '.monthly[0].totalCost * 100 | round / 100')

echo "Cost: \$${dailycost} (daily) / \$${monthlycost} (monthly)"
