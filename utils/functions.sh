#!/bin/bash

# Run the tests.
function tests() {
	dir="$(dirname "$0")/tests";
	clear;
	for test in $(ls ${dir}/*.sh);
	do
		details "Running ${test}" false true;
		source ${test};
	done
	sleep 2;
}

# Check if there is an update available.
function checkForUpdate() {
	clear;
	details "Checking for updates..." false;
	echo -e "";
	cd $(dirname "$0");
	git pull origin master;
	if [ $? -ne 0 ]; then
		throw "Unable to check for updates. Please check your internet connection." true;
	else
		success "Updated successfully ✅" true;
		echo -e "";
	fi
	sleep 2;
}

# Start the program.
function maintaining() {
	clear;
	if [ ${1:-0} == "false" ];
	then
		echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Vérification du système... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Lancement de l'application... "; sleep 0.5; echo -e "✅"; sleep 0.2
	fi
	while true; do
		MaitainingMenuTemplate;
    echo -n -e "Indiquer l'option désirée [\033[0;33mnull\033[0m]: "; read option;
    case ${option} in
    	1) SystemInformationsCommand; break;;
    	2) EnterShellCommand; break;;
    	3) UpdateApplicationCommand; break;;
    	4) SetupApplicationCommand; break;;
    	5) EnvApplicationCommand; break;;
    	6) PostfixConfig; break;;
      7) ApacheConfig; break;;
      8) DatabaseConfig; break;;
      9) ServicesConfig; break;;
      10) ServerConfig; break;;
      *);;
    esac
  done;
}

MaitainingMenuTemplate ()
{
	clear;
	echo -n "Vérification de vos permissions... "; echo -e "✅";
	echo -n "Vérification du système... "; echo -e "✅";
	echo -n "Lancement de l'application... "; echo -e "✅";
	echo -e "\nSystème: \033[1;35m${SERVER_SYSTEM}\033[0m";
	echo -e "Nom de l'hôte: \033[1;35m${SERVER_NAME}\033[0m"
	echo -e "Nom de l'utilisateur: \033[1;35m${USER}\033[0m"
	echo -e "\n***********************************************************"
	echo -e "****** Application de maintenance du serveur - \033[0;33m${APP_VERSION}\033[0m ******";
	echo -e "***********************************************************\n"
	echo -e "1) Informations systèmes	  6) Paramètres de Postfix";
	echo -e "2) Entrer dans le terminal	  7) Paramètres d'Apache";
	echo -e "3) Mettre à jour un site	  8) Paramètres de MariaDB";
	echo -e "4) Réinitialiser un site	  9) Redémarrer un service";
	echo -e "5) Gérer un site           	 10) Gérer le serveur\n\n";
}

# Store log in the specified history file.
function newLog ()
{
	log_file="LOG_${1^^}";
	echo -e $2 >> $LOG_HISTORY;
	echo -e "[: $SERVER_SYSTEM - $SERVER_NAME :]" $2 >> ${!log_file};
}

# Show the selected tab.
function selectecOption() {
	echo -e "Option sélectionnée : \033[0;33m$1\033[0m.\n";
}