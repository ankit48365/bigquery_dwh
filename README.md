<h2>Google Big Query - Data Platform</h2>
Tech Stack used in this Project
<div style="text-align: center;">
  <table>
    <tr>
      <td align="center"><img src="./logo/microsoft-sql-server-log.png" width="50"/></td>
      <td align="center"><img src="./logo/Python-logo.png" width="50"/></td>
      <td align="center"><img src="./logo/airflow-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/dbt-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/BigQueryLogo2.png" width="50"/></td>
      <td align="center"><img src="./logo/github-svgrepo-com.png" width="50"/></td>
      <td align="center"><img src="./logo/lightdashlogo.png" width="50"/></td>
    </tr>
  </table>
</div>

<h3>Design Flow:</h3>

```
Data Pipeline
├── Windows Local Machine
│   └── SQL Server Database (Source System)
│       └── Data extracted as CSV
│
├── Ubuntu Server Local Machine
│   ├── Airflow
│   │   └── Schedules and triggers Python Jobs
│   │       └── Python Jobs
│   │           └── Moves SQL Server data as CSV to Ubuntu Server
│   ├── Big Query CLI
│   │   └── Uploads CSV files to Big Query Cloud (Staging Layer)
│   └── DBT Core
│       └── Interacts with Big Query Cloud
│           └── Transforms data and moves to Transformation Layer
│
└── Big Query Cloud
    ├── Bronze: Landing Layer
    │   └── Receives CSV files from Big Query CLI
    ├── Silver : Staging Layer
    │   └── Receives transformed data from DBT Core
    └── Gold: denormalized layer integrated with Lightdash
        └── Creates BI visuals and defines metrics by leveraging schema.yml files from dbt GitHub repository
```

<h3>SNAPSHOTS:</h3>

Airflow - Orchestration

![Airflow Data Pipeline Diagram](logo/Airflow_bquery.png "Data Pipeline Overview")

BigQuery - Data Platform

![Big Query Data Platform](logo/BigQuery_Dahboard.png "Data Platform Overview")

LightDash - Analytics Interface

![LightDash Analytics](logo/lighdash_dashboard.png "Anlytics Interface Overview")