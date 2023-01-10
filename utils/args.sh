#!/bin/bash

args="$@";

if [ -z "${args}" ]; then
	args="--null";
fi

skip="false";
maintenance="false";
noUpdate="false";
noAnimations="false";

for arg in ${args}
do
	if [[ "${arg}" == "-h" ]] || [[ "${arg}" == "--help" ]]; 
	then
		echo -e "\nUsage: bash app.sh [\033[1;33moptions\033[0m]\n";
		echo -e "Available options:\n";
		echo -e "  \033[1;33m-h\033[0m, \033[1;33m--help\033[0m: Display the help.";
		echo -e "  \033[1;33m-c\033[0m, \033[1;33m--config\033[0m: Setup configuration.";
		echo -e "  \033[1;33m-t\033[0m, \033[1;33m--tests\033[0m: Launch tests only.";
		echo -e "  \033[1;33m-s\033[0m, \033[1;33m--skip\033[0m: Skip checks (update, tests, etc...) and animations.";
		echo -e "  \033[1;33m--no-update\033[0m: Disable the update check only.";
		echo -e "  \033[1;33m-m\033[0m, \033[1;33m--maintenance\033[0m: Launch the program in production mode (test skipped).\n";
		exit 0;
	elif [[ "${arg}" == "-c" ]] || [[ "${arg}" == "--config" ]]; 
	then
		source $(dirname "$0")/utils/config.sh;
		exit 0;
	elif [[ "${arg}" == "-t" ]] || [[ "${arg}" == "--tests" ]]; 
	then
		tests;
		exit 0;
	elif [[ "${arg}" == "-s" ]] || [[ "${arg}" == "--skip" ]]; 
	then
		skip="true";
	elif [[ "${arg}" == "-m" ]] || [[ "${arg}" == "--maintenance" ]]; 
	then
		maintenance="true";
	elif [[ "${arg}" == "--no-update" ]]; 
	then
		noUpdate="true";
	fi
done