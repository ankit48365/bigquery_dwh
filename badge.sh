#!/bin/bash

# Run sqlfluff and save the verbose output
uv run sqlfluff lint -v proj_dbt/dbt_pizza/models/ > sqlfluff_report.txt || true

# Extract the number of violations from the summary
VIOLATION_COUNT=$(grep -A 1 '==== summary ====' sqlfluff_report.txt | grep -oP 'violations:\s+\K\d+')

# Validate extraction
if [ -z "$VIOLATION_COUNT" ]; then
  echo "Failed to retrieve SQLFluff violation count!"
  exit 1
fi

echo "SQLFluff Violations: $VIOLATION_COUNT"

# Remove existing SQLFluff badge if it exists
sed -i '/!\[sqlfluff\]/d' README.md

# Insert updated badge at the top of README
echo "![sqlfluff](https://img.shields.io/badge/sql%20violations-$VIOLATION_COUNT-red)" | cat - README.md > temp.md && mv temp.md README.md