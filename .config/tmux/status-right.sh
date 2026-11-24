#!/bin/bash
set -euo pipefail
echo -n "AI Usage: "
ccusage monthly --json --offline --order desc --by-agent | jq '.monthly[0].agents[] | "\(.agent) $\(.totalCost * 100 | round / 100)"' | jq -rs 'join(" / ")'
