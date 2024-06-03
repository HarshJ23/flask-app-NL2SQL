#!/usr/bin/env bash

# Update package list and install necessary tools
apt-get update && apt-get install -y curl apt-transport-https gnupg2

# Add the Microsoft package repository for ODBC drivers
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

# Update the package list again and install the ODBC driver
apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18

# Install unixODBC development headers
apt-get install -y unixodbc-dev

# Verify ODBC driver installation
odbcinst -j
