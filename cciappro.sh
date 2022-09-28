#!/bin/bash

# =========================
# Environment variables
# =========================
source $(dirname "$0")/.env;

# =========================
# Helpers
# =========================
for helper in app/Helpers/*; do source $helper; done

# =========================
# Commands
# =========================
for command in app/Commands/*; do source $command; done

# =========================
# Maintaining
# =========================
source $(dirname "$0")/maintaining.sh

maintaining;