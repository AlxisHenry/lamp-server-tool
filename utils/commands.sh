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
	echo "";
}

function serviceSettings() {
	echo "";
}