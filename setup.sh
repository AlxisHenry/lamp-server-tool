#!/bin/bash

cp .env.example .env;
bash config/.env.sh;
bash config/config.sh bashrc;
