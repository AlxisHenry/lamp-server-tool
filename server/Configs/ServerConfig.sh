# =============================
# Server Config
# =============================

ServerConfig ()
{
	while true; do
		MaitainingMenuTemplate;
		ServerConfigTemplate;
    	echo -n -e "Indiquer l'action à effectuer (:q pour annulé) [\033[0;33mnull\033[0m]: "; read action;
    	case $action in
    		a) RunSystemUpdateCommand apache2; break;;
    		b) RestartServerCommand mariadb; break;;
            :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    	esac
    done;
	ReturnToMenuHelper --force;
}