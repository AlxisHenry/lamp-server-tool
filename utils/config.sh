#!/bin/bash

if [ ! -f "app.sh" ]; then
	throw "Please run the script from the root directory." true;
fi

clear;

# Add load command to .bashrc
function configureBashrc() {
	details "Configuring .bashrc..." false;
	grep -q "bash $(pwd)/app.sh --maintenance" ~/.bashrc;
	if [ $? -eq 0 ]; then
		warning "Command already present in .bashrc. Configuration aborted" true;
		return 1;
	fi
	echo -e "bash $(pwd)/app.sh --maintenance" >> ~/.bashrc;
	if [ $? -ne 0 ]; then
		throw "Unable to configure .bashrc. Please check your permissions" true;
	else
		details "+ bash $(pwd)/app.sh --maintenance" true;
		success "File configured successfully ✅" true;
	fi
}

# Configure .env variables
function configureEnv() {
	details "Configuring .env..." true;
	if [ ! -f ".env" ]; then
		cp .env.example .env;
		if [ $? -ne 0 ]; then
			throw "Unable to create .env file. Please check your permissions" true;
		fi
	fi
	# Get DB credentials
	echo -e ""; 
	echo -e "Enter your database username [\e[0;33mroot\e[0m]"; printf '> '; read DB_USERNAME; echo -e "";
	echo -e "Enter your database password [\e[0;33mnull\e[0m]"; printf '> '; read DB_PASSWORD; echo -e "";
	# Default values if empty
	if [ -z "${DB_USERNAME}" ]; then
		DB_USERNAME="root";
	fi
	if [ -z "${DB_PASSWORD}" ]; then
		DB_PASSWORD="";
	fi
	sed -i "s/DB_USERNAME=/DB_USERNAME=${DB_USERNAME}/g" .env;
	sed -i "s/DB_PASSWORD=/DB_PASSWORD=${DB_PASSWORD}/g" .env;
	if [ $? -ne 0 ]; then
		throw "Unable to configure .env. Please check your permissions" false;
	else
		details "+ DB_USERNAME=${DB_USERNAME}" false;
		details "+ DB_PASSWORD=${DB_PASSWORD}" false;
		success "File configured successfully ✅" true;
		echo -e "";
	fi
}

configureBashrc;
configureEnv;