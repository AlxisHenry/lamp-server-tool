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
    	4) appUpdate; break;;
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
	echo -e "4) Mettre à un jour un site     8) Paramètres de Postfix\n";
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