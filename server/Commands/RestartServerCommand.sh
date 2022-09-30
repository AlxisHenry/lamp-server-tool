# =========================
# Restart Server Command
# =========================

RestartServerCommand ()
{
	FunctionStarterHelper;
	echo -n "Le serveur va redémarrer dans un instant"; 
	PrintDotsHelper;
	RestartServerHelper;
}