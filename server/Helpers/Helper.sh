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
    	echo -n -e "\nRetourner à l'accueil (écrire :q) : :"; read quit;
    	case $quit in
    		[*q/*Q]) maintaining 1; break;;
            *) ;;	
    	esac
    done;
}

H_stop_script_execution ()
{
	exit;
}


