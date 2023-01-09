#!/bin/bash

# Contact: https://alexishenry.eu/contact
# Github : https://github.com/AlxisHenry/server-maintenance
# Request: https://github.com/AlxisHenry/server-maintenance/issues

# This script is a server maintenance tool for web servers on Ubuntu 22.04 LTS.
# The type of applications that can be managed are:
# - Laravel
# It allows you to manage your web server easily.

# It is a simple script that allows you to:
# - Manage your databases (backup, restore, delete, etc.).
# - Manage services (restart, stop, start, etc.).
# - Manage applications (restart, stop, start, etc.).
# - Manage your server (restart, stop, start, etc.).
# - Get informations about your server (CPU, RAM, etc.).
# - Get informations about your applications (CPU, RAM, etc.).
# - Keep your server up to date.
# - Keep your applications up to date.
# - Check if emails are working.

# Steps todo to setup the program:
# 1. Launch configuration (more details about the automatic configuration in the readme):
#		- $ bash app.sh --config | $ make config
# 2. Launch tests only:
#		- $ bash app.sh --tests | $ make tests
# 3. Launch the program in development mode (check if everything is working):
#		- $ bash app.sh
# 4. Launch the program in production mode (skip tests):
#		- $ bash app.sh --maintenance

# Availble make commands:
# $ make config: Launch configuration.
# $ make tests: Launch the tests.

# Tips:
# - If you use the automatic configuration, the program will be launched when you create a new terminal.
# - If you configure the program manually, you can add the following line to your .bashrc file:
#		- $ bash /path/to/app.sh --maintenance
# - When you make backups of your databases, they will be stored in the folder "database/backups/".
# - Services are managed with the "systemctl" command.
# - If you want to add a new service, you must add it in the ".env" of the program.

# For more details about this program:
# - Read the readme.
# - Read the source code.

source $(dirname "$0")/.env

# Options (you can add or remove options in the file "utils/args.sh"):
# -h, --help: Display the help.
# -c, --config: Setup configuration.
# -t, --tests: Launch tests only.
# -s, --skip: Skip startup animations and tests.
# -d, --debug: Display the debug messages.
# -m, --maintenance: Launch the program in production mode (test skipped).

# If you dont specify any option, the program will be launched in development mode.
# In this mode, the program will be launched without the `--skip` option.
# So you will see the startup animations and the tests will be run before the launch of the program.

source $(dirname "$0")/utils/args.sh
