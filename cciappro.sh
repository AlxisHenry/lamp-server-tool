#!/bin/bash

# To execute this script run : bash cciappro.sh maintaining (1 : for skip startup animations)

cd $(dirname "$0");

# =========================
# Environment variables
# =========================
source $(dirname "$0")/.env;

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