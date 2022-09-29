#!/bin/bash

# To execute this script run : bash cciappro.sh maintaining

cd $(dirname "$0");

# =========================
# Environment variables
# =========================
source .env;

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

# =========================
# Maintaining
# =========================
source maintaining.sh;

"$@"