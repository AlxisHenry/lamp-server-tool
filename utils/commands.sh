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

function appUpdate() {
	echo "";
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