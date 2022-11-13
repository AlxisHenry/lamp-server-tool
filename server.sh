#!/bin/bash

# To execute this script run : bash cciappro.sh maintaining (--skip : to skip startup cooldown)

cd $(dirname "$0");

# =========================
# Environment variables
# =========================
source $(dirname "$0")/.env;

# =========================
# Check for updates
# =========================
git pull origin master;

# =========================
# Helpers
# =========================
for Helper in $HELPERS; do source $Helper; done

# =========================
# Commands
# =========================
for Command in $COMMANDS; do source $Command; done

# =========================
# Configs
# =========================
for Config in $CONFIGS; do source $Config; done

"$@"