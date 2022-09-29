# =========================
# Restart Server Command
# =========================

RestartServerCommand ()
{
	clear;
	echo -n "Le serveur va redémarrer dans un instant"; 

	for i in {1..3} 
	do
		sleep 0.8;
		printf "."; 
	done;

	printf "\n";

}