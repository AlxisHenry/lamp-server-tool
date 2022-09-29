# @param bool $1 => Skip checkup
maintaining ()
{
	clear;
	if [ ${1:-0} != 1 ] 
	then
		echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Vérification du système... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Lancement de l'application... "; sleep 0.5; echo -e "✅"; sleep 0.2
	fi
	while true; do
		template;
    	echo -n -e "Indiquer l'option désirée [\033[0;33mnull\033[0m]: "; read option;
    	case $option in
    		1) SystemInformationsCommand; break;;
    		2) EnterShellCommand; break;;
    		3) UpdateApplicationCommand; break;;
    		4) SetupApplicationCommand; break;;
    		5) EnvApplicationCommand; break;;
    		6) PostfixConfig; break;;
        	7) ApacheConfig; break;;
        	8) DatabaseConfig; break;;
        	9) RestartServicesCommand; break;;
        	10) RestartServerCommand; break;;
            *) ;;	
    	esac
    done;
}

template ()
{
	clear;
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