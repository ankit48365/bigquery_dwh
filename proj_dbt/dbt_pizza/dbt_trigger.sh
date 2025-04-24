#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# echo "LOAD_PATH: $(LOAD_PATH)"


# Path to the Python interpreter in the virtual environment
VENV_PATH="${LOAD_PATH}proj_dbt/.venv/"
# echo "VENV_PATH: $(VENV_PATH)"


# Path to the Python script to be executed
SCRIPT_PATH="${LOAD_PATH}proj_dbt/dbt_pizza"
# echo "SCRIPT_PATH: $(SCRIPT_PATH)"

# Activate the virtual environment
source $VENV_PATH/bin/activate

# Change to the script directory
cd $SCRIPT_PATH

# Run the dbt command
# echo "Command: ${COMMAND}"
dbt ${COMMAND} #>> $OUTPUT_FILE

# # Output file
# OUTPUT_FILE="${MDS_LOAD_PATH}/dbt/dbt_loadacc/dbt_loadacc_log.out"

# # Write the time of script execution to the output file
# echo "Script execution started at: $(date)" >> $OUTPUT_FILE

