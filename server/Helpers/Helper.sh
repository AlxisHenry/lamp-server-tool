# =============================
# Helper Functions
# =============================

H_command_starter ()
{
	clear
}

H_return_maintaining_homepage ()
{
	while true; do
    	echo -n -e "\nRetourner à l'accueil (écrire :q) "; read quit;
    	case $quit in
    		:q) maintaining 1; break;;
            *) ;;	
    	esac
    done;
}

H_restart_server ()
{
	sudo shutdown -r now;
}

H_stop_script_execution ()
{
	exit;
}

H_selected_option ()
{
	echo -e "Option sélectionnée : \033[0;33m$1\033[0m.\n"
}


