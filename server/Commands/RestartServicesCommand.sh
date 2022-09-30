# =========================
# RestartServices Command
# =========================

RestartServicesCommand ()
{
	service=$1;
	echo -n -e "\nRedémarrage du service \033[1;35m$service\033[0m en cours.";
	PrintDotsHelper;
	sudo systemctl restart $service;
	echo -e -n "\n\nLe service a correctement été redémarré. Vous allez être redirigé vers le menu principal.";
	PrintDotsHelper;
	maintaining 1;
}