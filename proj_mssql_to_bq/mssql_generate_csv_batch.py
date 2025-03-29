from src.connection_utility import make_string #here makestring is called because we are hardcoding the connection using variables to directly run a connection from connections.yaml file

from sqlalchemy import create_engine
import pandas as pd
import os
import yaml

def batch_db2csv():
    # Get the output directory and schema from user
    file_out = os.getenv("V_FILE_OUT")
    schema = os.getenv("V_SCHEMA")
    db_confid = os.getenv("V_DB_CONF_NAME")
    conn_home = os.getenv('conn_home')
    # schema = 'load'
    
    # Ensure the output directory exists
    if not os.path.exists(file_out):
        os.makedirs(file_out)

    # Load database connection
    connections_file = os.path.join(conn_home, 'connections.yaml')
    if os.path.exists(connections_file):
        with open(connections_file, 'r') as file:
            connections = yaml.safe_load(file)

    connection_details = connections[db_confid]
    conn = make_string(connection_details)
    engine = create_engine(conn)


    # Query to get all table names under the schema
    query = f"""
        SELECT TABLE_NAME 
        FROM INFORMATION_schema.TABLES 
        WHERE TABLE_schema = '{schema}'
    """
    tables = pd.read_sql_query(query, engine)

    # Iterate over each table and export to CSV
    for index, row in tables.iterrows():
        table_name = row["TABLE_NAME"]
        output_file = os.path.join(file_out, f"{table_name}.csv")

        # Fetch data from the table
        table_query = f"SELECT * FROM {schema}.{table_name}"
        df = pd.read_sql_query(table_query, engine)

        # Save the dataframe to CSV
        df.to_csv(output_file, sep="~", index=False)
        print(f"Exported {table_name} to {output_file}")

if __name__ == "__main__":
    batch_db2csv()
