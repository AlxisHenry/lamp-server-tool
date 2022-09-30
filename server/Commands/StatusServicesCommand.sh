# =========================
# StatusServices Command
# =========================

StatusServicesCommand ()
{
	service=$1;
	echo -n -e "\nRécupération du statut du service \033[1;35m$service\033[0m en cours.";
	PrintDotsHelper;
	echo -e "\n";
	sudo systemctl status $service;
	echo -e -n "\n\033[1;32mLe statut a correctement été récupéré.\033[0m\n";
	newLog command "Vérification du statut du service [$service], date: $(date).";
	ReturnToMenuHelper;
}