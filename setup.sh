#!/usr/bin/env bash

# Install necessary packages
apt-get update && apt-get install -y curl apt-transport-https gnupg

# Install ODBC Driver 18 for SQL Server
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | tee /etc/apt/sources.list.d/msprod.list
apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18

# Verify installation
odbcinst -j
