# This script will configure .env needed variables	   
	
configuration () {

	clear;

	echo -e "\n[\e[0;32m Configure your .env file \e[0m]\n"

	# SET DB_DATABASE
    echo -e "  Database name [\e[0;33mnull\e[0m]";
    printf '> ';
    read DB_DATABASE;
        
	# SET DB_USERNAME
    echo -e "\n  Username [\e[0;33mnull\e[0m]";
    printf '> ';
    read DB_USERNAME;
        
	# SET DB_PASSWORD
    echo -e "\n  Password [\e[0;33mnull\e[0m]";
    printf '> ';
    read DB_PASSWORD;
	
	echo -e "";

	ENV="DB_DATABASE DB_USERNAME DB_PASSWORD";

    # SED .ENV FILE
    for VAR in ${ENV}; do
        sed "s/$VAR=/&${!VAR}/" -i .env;
    done

}

configuration;