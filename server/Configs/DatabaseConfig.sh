# =============================
# Database Config
# =============================

DatabaseConfig ()
{
	while true; do
		MaitainingMenuTemplate;
		DatabaseConfigTemplate;
    	echo -n -e "Action à effectuer (:q pour annulé) [\033[0;33mnull\033[0m]: "; read action;
    	case $action in
    		a) echo ''; break;;
			b) StatusServicesCommand mariadb; break;;
    		c) ReloadServicesCommand mariadb; break;;
    		d) RestartServicesCommand mariadb; break;;
            :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    	esac
    done;
	ReturnToMenuHelper --force;
}