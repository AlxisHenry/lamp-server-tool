# =============================
# Template Helper
# =============================

MaitainingMenuTemplate ()
{
	FunctionStarterHelper;
	echo -n "Vérification de vos permissions... "; echo -e "✅";
	echo -n "Vérification du système... "; echo -e "✅";
	echo -n "Lancement de l'application... "; echo -e "✅";
	echo -e "\nSystem: \033[1;35m$SERVER_SYSTEM\033[0m";
	echo -e "Hostname: \033[1;35m$SERVER_NAME\033[0m"
	echo -e "Username: \033[1;35m$USER\033[0m"
	echo -e "\n***********************************************************"
	echo -e "****** Application de maintenance du serveur - \033[0;33m$APP_VERSION\033[0m ******";
	echo -e "***********************************************************\n"
	echo -e "1) Informations systèmes	  6) Paramètres de Postfix";
	echo -e "2) Entrer dans le terminal	  7) Paramètres d'Apache";
	echo -e "3) Mettre à jour un site	  8) Paramètres des bases de données";
	echo -e "4) Réinitialiser un site	  9) Redémarrer un service";
	echo -e "5) Gérer un site           	 10) Redémarrer le serveur\n\n";
}

ServicesSettingsTemplate ()
{
	SelectedOptionHelper "Redémarrer un service";

	echo -e "\nQuel service souhaitez-vous redémarrer ?"
	echo -e "----------------------------------------\n"
	echo -e "a) Apache";
	echo -e "b) MariaDB";
	echo -e "c) Postfix\n";
}
