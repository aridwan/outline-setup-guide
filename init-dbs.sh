#!/bin/bash
set -e  # Exit immediately if a command fails

psql -v ON_ERROR_STOP=1 -U postgres <<EOSQL
SELECT 'CREATE DATABASE keycloak'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'keycloak')\gexec

SELECT 'CREATE DATABASE outline'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'outline')\gexec
EOSQL
