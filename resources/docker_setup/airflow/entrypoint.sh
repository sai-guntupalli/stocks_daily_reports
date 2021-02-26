#!/usr/bin/env bash

export AIRFLOW_HOME=/usr/local/airflow

export AIRFLOW__CORE__LOAD_EXAMPLES=False

git init /usr/local/airflow

# Initiliase the metastore
airflow initdb

# Run the scheduler in background
airflow scheduler &> /dev/null &

# Run the web server in foreground (for docker logs)
exec airflow webserver
