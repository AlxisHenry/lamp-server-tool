# =========================
# Dump Database Command
# =========================

DumpDatabaseCommand ()
{
	echo "";
	SelectedOptionHelper "Réalisation d'un dump de la base de données";
	DatabaseDumpHelper;
	echo -n -e "\nDump de la base de données [\033[1;35m${DB_DATABASE}\033[0m] en cours";
	PrintDotsHelper;
	echo -e "\n";
	newLog command "Dump de la base de données [cciappro], date: $(date).";
	sleep 2
	ReturnToMenuHelper;
}	