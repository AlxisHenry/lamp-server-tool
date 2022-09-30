# =============================
# Helper Functions
# =============================

# @param string $1
SelectedOptionHelper ()
{
	echo -e "Option sélectionnée : \033[0;33m$1\033[0m.\n"
}

FunctionStarterHelper ()
{
	clear
}

ReturnToMenuHelper ()
{
	while true; do
    	echo -n -e "\nRetourner à l'accueil (écrire :q) "; read quit;
    	case $quit in
    		:q) maintaining 1; break;;
            *) ;;	
    	esac
    done;
}

RestartServerHelper ()
{
	sudo shutdown -r now;
}

StopExecutionHelper ()
{
	exit;
}

PrintDotsHelper ()
{
	for i in {1..3} 
	do
		sleep 1;
		printf "."; 
	done;
}