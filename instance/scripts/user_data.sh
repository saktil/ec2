#!/bin/bash

# Update package list and install Certbot if not already installed
sudo apt-get update
sudo apt-get install -y certbot

# Generate a wildcard certificate for *.doitpay.dev using DNS challenge
sudo certbot certonly --manual --preferred-challenges dns -d "*.doitpay.dev" --agree-tos --no-eff-email --manual-public-ip-logging-ok

# Display the location of the generated certificate
echo "Wildcard certificate for *.doitpay.dev has been generated. Check /etc/letsencrypt/live/doitpay.dev/ for the certificate and key."
