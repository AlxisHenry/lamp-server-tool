# @param bool $1 => Skip checkup
maintaining ()
{
	FunctionStarterHelper;
	if [ ${1:-0} != 1 ] 
	then
		echo -n "Vérification de vos permissions... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Vérification du système... "; sleep 0.5; echo -e "✅"; sleep 0.2
		echo -n "Lancement de l'application... "; sleep 0.5; echo -e "✅"; sleep 0.2
	fi
	while true; do
		MaitainingMenuTemplate;
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
        	9) ServicesSettings; break;;
        	10) RestartServerCommand; break;;
            *) ;;	
    	esac
    done;
}