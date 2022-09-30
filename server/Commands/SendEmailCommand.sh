# =========================
# Send Email Command
# =========================

SendEmailCommand ()
{	
	FunctionStarterHelper;
	SelectedOptionHelper "Envoi d'un email via postfix";
	echo -e "\n  Saisir l'email du destinataire [\e[0;33mnull\e[0m]";
	printf "> ";
	read email;
	echo -n -e "\nEnvoi d'un email à \033[1;35m$email\033[0m en cours.";
	PrintDotsHelper;
	echo -e '\n';
	echo "Test Postfix Gmail https://example.com" | mail -s "Postfix Gmail" $email
	echo -e -n "\n\033[1;32mL'email a correctement été envoyé. (destinataire: $email)\033[0m\n";
	newLog command "Envoi d'un email via postfix à [$email], date: $(date).";
	ReturnToMenuHelper;
}