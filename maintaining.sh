maintaining ()
{
	clear;
	echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2
	echo -n "Lancement de l'application... "; sleep 0.5; echo -e "✅"; sleep 0.2
	while true; do
		template;
    	echo -n 'Entrer une option: '; read option;
    	case $option in
    		[1]) SystemInformationsCommand; break;;
    		[2]) EnterShellCommand; break;;
    		[3]) UpdateApplicationCommand; break;;
    		[4]) SetupApplicationCommand; break;;
    		[5]) EnvApplicationCommand; break;;
    		[6]) PostfixConfig; break;;
        	[7]) ApacheConfig; break;;
        	[8]) DatabaseConfig; break;;
        	[9]) RestartServicesCommand; break;;
        	[10]) RestartServerCommand; break;;
            *) ;;	
    	esac
    done;
}

template ()
{
	clear;
	echo -n "Vérification de vos permissions... "; echo -e "✅";
	echo -n "Lancement de l'application... "; echo -e "✅";
	echo -e "\n\nSystem: \033[1;35m$SERVER_SYSTEM\033[0m";
	echo -e "Hostname: \033[1;35m$SERVER_NAME\033[0m"
	echo -e "Username: \033[1;35m$USER\033[0m"
	echo -e "\n\n***********************************************************"
	echo -e "****** Application de maintenance de serveur - $APP_VERSION ******";
	echo -e "***********************************************************\n\n"
	echo -e "1) Informations systèmes	  6) Paramètres de Postfix";
	echo -e "2) Entrer dans le terminal	  7) Paramètres d'Apache";
	echo -e "3) Mettre à jour le projet	  8) Paramètres du gestionnaire de base de données";
	echo -e "4) Réinitialiser le projet	  9) Redémarrer un service";
	echo -e "5) Modifier le .env		 10) Redémarrer le serveur";
	echo;
}