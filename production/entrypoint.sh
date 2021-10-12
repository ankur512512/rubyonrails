#!/bin/bash

# Doing db related setup
rails db:setup

# Running rails server
rails s -b 'ssl://0.0.0.0:3000?key=config/certs/prod.key&cert=config/certs/prod.crt'