#!/bin/bash

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

function show() {
	clear;
	if [ ${1:-0} == "false" ];
	then
		echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Vérification du système... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Lancement de l'application... "; sleep 0.5; echo -e "✅"; sleep 0.2
	fi
	while true; do
		showMenu;
    echo -n -e "Indiquer l'option désirée [\033[0;33mnull\033[0m]: "; read option;
    case ${option} in
    	1) system; break;;
    	2) server; break;;
    	3) shell; break;;
    	4) updateApp; break;;
    	5) services; break;;
    	6) showApache; break;;
      7) showDatabase "mariadb"; break;;
      8) showPostfix "postfix"; break;;
      *);;
    esac
  done;
}

function showMenu() {
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
	echo -e "1) Informations du système      5) Gestion des services";
	echo -e "2) Gestion du serveur           6) Paramètres d'Apache";
	echo -e "3) Ouvrir un terminal           7) Paramètres de MariaDB";
	echo -e "4) Mettre à jour le site        8) Paramètres de Postfix\n";
}

function log() {
	file="LOG_${1^^}";
	echo -e $2 >> ${LOG_HISTORY};
	echo -e "[: ${SERVER_SYSTEM} - ${SERVER_NAME} :]" $2 >> ${!file};
}

function selectedOption() {
	echo -e "Option sélectionnée : \033[0;33m$1\033[0m.\n";
}

function startCommand() {
	clear;
}

function showAppVersion() {
	for app in ${APPS}
	do
		version="VERSION_${app}";
		echo -e "Application: \033[1;35m${app}\033[0m, Version installée: \033[1;35m${!version}\033[0m";
	done;
}

function returnToMenu() {
	if [ ${1:-0} == "--skip" ] 
	then
		show --skip;
	else
		while true; do
			echo -n -e "\nRetourner à l'accueil (écrire :q) "; read quit;
			case $quit in
				:q) show --skip; break;;
				*) ;;	
			esac
    	done;
	fi
}

function showApache() {
	while true; do
		showMenu;
		selectedOption "Configuration d'Apache";
		echo -e "Quel action souhaitez vous effectuer ?\n"
		echo -e "a) Voir le statut du service";
		echo -e "b) Redémarrer correctement le service";
		echo -e "c) Forcer le redémarrage du service\n";
    echo -n -e "Action à effectuer (:q pour annuler) [\033[0;33mnull\033[0m]: "; read action;
    case $action in
			a) service "status" "apache2"; break;;
    	b) service "reload" "apache2"; break;;
    	c) service "restart" "apache2"; break;;
      :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    esac
  done;
	returnToMenu --skip;
}

function showPostfix() {
	while true; do
		showMenu;
		selectedOption "Configuration de Postfix";
		echo -e "Quel action souhaitez vous effectuer ?\n"
		echo -e "a) Envoyer un email de test";
		echo -e "b) Voir le statut du service";
		echo -e "c) Redémarrer correctement le service";
		echo -e "d) Forcer le redémarrage du service\n";    	
		echo -n -e "Action à effectuer (:q pour annuler) [\033[0;33mnull\033[0m]: "; read action;
    case $action in
    	a) sendTestEmail; break;;
			b) service "status" "postfix"; break;;
    	c) service "reload" "postfix"; break;;
    	d) service "restart" "postfix"; break;;
      :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    esac
  done;
	returnToMenu --skip;
}

function showDatabase() {
	while true; do
		showMenu;
		selectedOption "Configuration de MariaDB";
		echo -e "Quel action souhaitez vous effectuer ?\n"
		echo -e "a) Faire un dump des base de données";
		echo -e "b) Voir le statut du service";
		echo -e "c) Redémarrer correctement le service";
		echo -e "d) Forcer le redémarrage du service\n";    	
		echo -n -e "Action à effectuer (:q pour annuler) [\033[0;33mnull\033[0m]: "; read action;
    case $action in
    	a) dumpDatabases; break;;
			b) service "status" "mariadb"; break;;
    	c) service "reload" "mariadb"; break;;
    	d) service "restart" "mariadb"; break;;
      :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    esac
  done;
	returnToMenu --skip;
}

#!/bin/bash

function system() {
	startCommand;
	selectedOption "Informations du système";
	echo -e "\033[1;34mInformations générales du système : \033[0m"
	echo -e "\n- System: \033[1;35m$SERVER_SYSTEM\033[0m";
	echo -e "- Hostname: \033[1;35m$SERVER_NAME\033[0m"
	echo -e "- Username: \033[1;35m$USER\033[0m\n"
	echo -e "\033[1;34mAnalyse de la RAM : \033[0m\n"
	sudo free -h;
	echo -n -e "\n";
	top_memory_usage=$(ps -eo cmd,%mem,%cpu --sort=-%mem | head -n 11);
	echo -n -e "\n$top_memory_usage";
	echo -n -e "\n\n\033[1;34mRécupération des applications et de leur version en cours";
	wait;
	echo -e "\n\033[1;35mVersion des applications :\033[0m \n"
	showAppVersion;
	log command "Visualisation des informations du système, date: $(date).";
	returnToMenu;
}

function shell() {
	startCommand;
	selectedOption "Entrer dans le terminal";
	details "Fermeture du logiciel ; ouverture d'un terminal." true; sleep 0.5; echo -e "\n";
	log command "Sortie du logiciel de la part de l'utilisateur : ouverture d'un terminal, date: $(date).";
	exit;
}

function server() {
	while true; do
		showMenu;
		selectedOption "Gestion du serveur";
		echo -e "Quelle action souhaitez vous effectuer ?\n"
		echo -e "a) Mettre à jour le serveur";
		echo -e "b) Redémarrer le serveur\n";    
		echo -n -e "Indiquer l'action à effectuer (:q pour annuler) [\033[0;33mnull\033[0m]: "; read action;
    case $action in
    	a) serverUpdate; break;;
    	b) serverRestart; break;;
      :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    esac
  done;
	returnToMenu --skip;
}

function serverUpdate() {
	echo "";
	selectedOption "Mise à jour du serveur";
	details "Mise à jour des paquets en cours";
	sudo apt update > /dev/null 2>&1 && sudo apt upgrade -y > /dev/null 2>&1;
	if [ $? -eq 0 ] 
	then 
		success "Paquets mis à jour avec succès" true;
		status="done";
	else 
		warning "Une erreur s'est produite durant la mise à jour des paquets, réessayez ultérieurement." true;
		status="failed";
	fi
	log command "Mise à jour des paquets du serveur (system update), status: ${status}, date: $(date)";
	returnToMenu;
}

function serverRestart() {
	startCommand;
	selectedOption "Redémarrage du serveur";
	warning "Le serveur va redémarrer dans un instant";
	log command "Redémarrage du serveur, date: $(date).";
	sudo shutdown -r now;
}

function services() {
	while true; do
		showMenu;
		selectedOption "Gestion des servivces";
		echo -e "Sélectionner un des services ci-dessous\n"
		echo -e "a) Apache";
		echo -e "b) MariaDB";
		echo -e "c) Postfix\n";    	
		echo -n -e "Préciser le service (:q pour annuler) [\033[0;33mnull\033[0m]: "; read service;
		case ${service} in
			a) apache "apache2"; break;;
			b) postfix "mariadb"; break;;
			c) database "postfix"; break;;
			:q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
		esac
  done;
	returnToMenu --skip;
}

function service() {
	echo "";
  if [ "${1}" == "status" ]; then
		details "Affichage du statut du service \033[1;35m${2}\033[0m en cours.";
    sudo systemctl status "${2}"
  elif [ "${1}" == "reload" ]; then
		details "Actualisation du service \033[1;35m${2}\033[0m en cours.";
   sudo systemctl reload "${2}"
  elif [ "${1}" == "restart" ]; then
		details "Redémarrage du service \033[1;35m${2}\033[0m en cours.";
    sudo systemctl restart "${2}"
	fi
	log command "Action sur le service [${2}], type: ${1}, date: $(date).";
	returnToMenu;
}

function sendTestEmail() {
	startCommand;
	selectedOption "Envoi d'un email de test via postfix";
	echo -e "\n  Saisir l'email du destinataire [\e[0;33mnull\e[0m]";
	printf "> ";
	read email;
	echo -n -e "\nEnvoi d'un email à \033[1;35m${email}\033[0m en cours.";
	wait;
	echo -e '\n';
	echo "Test Postfix Gmail https://example.com" | mail -s "Postfix Gmail" ${email}
	if [ $? -eq 0 ]
	then 
		echo -e -n "\n\033[1;32mL'email a correctement été envoyé. (destinataire: ${email})\033[0m\n";
		status="done";
	else 
		echo -e -n "\n\033[1;31mL'email n'a pas pu être envoyé. (destinataire: ${email})\033[0m\n";
		status="failed";
	fi
	log command "Envoi d'un email via postfix à [${email}], status: ${status}, date: $(date).";
	returnToMenu;
}

function dumpDatabases() {
	echo "";
	selectedOption "Dump des base de données";
	echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2;
  echo -n "Exclusion de la base de données par défaut de MySQL... "; sleep 0.5; echo -e "✅"; sleep 0.2;
  echo -n "Récupération de la liste des bases de données... "; sleep 0.5; echo -e "✅"; sleep 0.2;
	echo "";
  databases=$(sudo mysql -Bse "SHOW DATABASES" | grep -v "^mysql$" | grep -v "^information_schema$" | grep -v "^performance_schema$" | grep -v "^sys$");
  for database in $databases; do
    filename="$database-$(date +%s).sql";
		log command "Création du dump de la base de données $database, date $(date)";
    sudo mysqldump --databases $database > ${DB_DUMPPATH}/${filename};
  done
  echo -e "\n\033[1;32mToutes les bases de données ont été exportées avec succès !\033[0m"
	returnToMenu;
}

function updateApp() {
	echo "";
	selectedOption "Mise à jour du site";

	cd ${SITE_DIR};

	php artisan down;

	sleep 5;

	git pull origin master > /dev/null 2>&1;

	rm -rf vendor/ node_modules/ > /dev/null 2>&1;
	
	composer install --no-dev --optimize-autoloader > /dev/null 2>&1 && npm install > /dev/null 2>&1;

	npm run build > /dev/null 2>&1;

	php artisan up;

	returnToMenu;
}