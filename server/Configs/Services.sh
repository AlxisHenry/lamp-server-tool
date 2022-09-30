# =============================
# Services Config
# =============================

ServicesSettings ()
{
	while true; do
		MaitainingMenuTemplate;
		ServicesSettingsTemplate;
    	echo -n -e "Préciser le service (:q pour annulé) [\033[0;33mnull\033[0m]: "; read service;
    	case $service in
    		a) RestartServicesCommand apache2; break;;
    		b) RestartServicesCommand mariadb; break;;
    		c) RestartServicesCommand postfix; break;;
            :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    	esac
    done;
	maintaining --skip;
}