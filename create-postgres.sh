#!/bin/bash
set -e

# TODO: Do not create test database in production
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';
  CREATE DATABASE $DB_NAME;
  CREATE DATABASE $DB_NAME_TEST;
  GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
  GRANT ALL PRIVILEGES ON DATABASE $DB_NAME_TEST TO $DB_USER;
EOSQL

psql -v ON_ERROR_STOP=1 $DB_NAME $POSTGRES_USER <<-EOSQL
  CREATE SCHEMA $DB_USER;
  GRANT ALL on schema $DB_USER to $DB_USER;
  CREATE EXTENSION PGCRYPTO WITH SCHEMA $DB_USER;
EOSQL

psql -v ON_ERROR_STOP=1 $DB_NAME_TEST $POSTGRES_USER <<-EOSQL
  CREATE SCHEMA $DB_USER;
  GRANT ALL on schema $DB_USER to $DB_USER;
  CREATE EXTENSION PGCRYPTO WITH SCHEMA $DB_USER;
EOSQL
