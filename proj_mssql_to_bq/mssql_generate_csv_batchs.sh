set -e

# Path to the Python interpreter in the virtual environment
VENV_PATH="${LOAD_PATH}/proj_mssql_to_bq/.venv/bin/python"

# Path to the Python script to be executed
SCRIPT_PATH="${LOAD_PATH}/proj_mssql_to_bq/mssql_generate_csv_batch.py"

# Activate the virtual environment and run the Python script, then append the output or error to the output file
$VENV_PATH $SCRIPT_PATH