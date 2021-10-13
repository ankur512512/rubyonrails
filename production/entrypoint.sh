#!/bin/bash

# Sleeping for 5 seconds so that DB is ready to accept connections.
sleep 5

# Doing db related setup
rails db:setup

# Running rails server on HTTPS
rails s -b 'ssl://0.0.0.0:3000?key=config/certs/prod.key&cert=config/certs/prod.crt'