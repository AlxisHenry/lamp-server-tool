# =========================
# Sys. Info Command
# =========================

SystemInformationsCommand () 
{
	FunctionStarterHelper;
	SelectedOptionHelper "Informations système";
	echo -e "\033[1;34mInformations générales du système : \033[0m"
	echo -e "\n- System: \033[1;35m$SERVER_SYSTEM\033[0m";
	echo -e "- Hostname: \033[1;35m$SERVER_NAME\033[0m"
	echo -e "- Username: \033[1;35m$USER\033[0m\n"
	echo -e "\033[1;35mAnalyse du système :\033[0m \n"
	sudo lshw -short	
	echo -e "\n\033[1;35mAnalyse de la RAM :\033[0m \n"
	sudo free -h
	echo -e "\n\033[1;35mAnalyse du stockage :\033[0m \n"
	sudo df -h --total /dev /run
	echo -n -e "\n\033[1;34mRécupération des applications et de leur version en cours";
	PrintDotsHelper;
	echo -e "\n\n\033[1;35mVersion des applications :\033[0m \n"
	AppVersionsHelper;
	newLog command "Visualisation des informations système, date: $(date).";
	ReturnToMenuHelper;
}