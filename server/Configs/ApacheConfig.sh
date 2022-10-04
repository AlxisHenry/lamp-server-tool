# =============================
# Apache Config
# =============================

ApacheConfig ()
{
	while true; do
		MaitainingMenuTemplate;
		ApacheConfigTemplate;
    	echo -n -e "Action à effectuer (:q pour annuler) [\033[0;33mnull\033[0m]: "; read action;
    	case $action in
    		a) ListingVirtualHostCommand; break;;
			b) StatusServicesCommand apache2; break;;
    		c) ReloadServicesCommand apache2; break;;
    		d) RestartServicesCommand apache2; break;;
            :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    	esac
    done;
	ReturnToMenuHelper --force;
}