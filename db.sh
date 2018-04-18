#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER polis;
    CREATE DATABASE polis;
    GRANT ALL PRIVILEGES ON DATABASE polis TO polis;
EOSQL

psql -U polis polis < /polis_db_setup.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    ALTER TABLE math_main ADD COLUMN caching_tick bigint;
EOSQL
