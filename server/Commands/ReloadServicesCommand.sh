# =========================
# ReloadServices Command
# =========================

ReloadServicesCommand ()
{
	service=$1;
	echo -n -e "\nRedémarrage [\033[1;35mreload\033[0m] du service \033[1;35m$service\033[0m en cours.";
	PrintDotsHelper;
	echo -e "\n";
	sudo systemctl reload $service;
	echo -e -n "\n\033[1;32mLe service a correctement été redémarré.\033[0m\n";
	newLog command "Redémarrage [reload] du service [$service], date: $(date).";
	ReturnToMenuHelper;
}