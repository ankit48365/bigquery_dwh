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
      <td align="center"><img src="./logo/vscode-svgrepo-com.png" width="50"/></td>
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
    ├── Staging Layer
    │   └── Receives CSV files from Big Query CLI
    ├── Transformation Layer
    │   └── Receives transformed data from DBT Core
    └── Looker Studio
        └── Captures data from Transformation Layer for BI Visuals
```