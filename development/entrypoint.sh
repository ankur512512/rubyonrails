#!/bin/bash

rails db:setup

rails s -b 'ssl://0.0.0.0:3000?key=config/certs/dev.key&cert=config/certs/dev.crt'