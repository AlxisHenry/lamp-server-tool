# =============================
# Postfix Config
# =============================

PostfixConfig ()
{
	while true; do
		MaitainingMenuTemplate;
		PostfixConfigTemplate;
    	echo -n -e "Action à effectuer (:q pour annulé) [\033[0;33mnull\033[0m]: "; read action;
    	case $action in
    		a) SendEmailCommand; break;;
			b) StatusServicesCommand postfix; break;;
    		c) ReloadServicesCommand postfix; break;;
    		d) RestartServicesCommand postfix; break;;
            :q) echo -e "\n\033[1;31mOpération annulée. Vous allez être redirigé au menu principal dans un instant...\033[0m"; sleep 1.5; break;;	
    	esac
    done;
	ReturnToMenuHelper --force;
}