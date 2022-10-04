# =========================
# System Update Command
# =========================

RunSystemUpdateCommand ()
{
	echo '';
	SelectedOptionHelper "Mise à jour du serveur";
	ServerUpdateHelper;
	echo -n -e "Mise à jour des paquets en cours";
	PrintDotsHelper;
	echo -e "\n";
	newLog command "Mise à jour des paquets du serveur (system update), date: $(date)";
	sleep 2
	ReturnToMenuHelper;
}