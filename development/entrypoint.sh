#!/bin/bash

# Sleeping for 5 seconds so that DB is ready to accept connections.
sleep 5

# Creating schema
rails db:setup

# Starting rails server on HTTPS
rails s -b 'ssl://0.0.0.0:3000?key=config/certs/dev.key&cert=config/certs/dev.crt'