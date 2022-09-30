# =========================
# Enter Shell Command
# =========================

EnterShellCommand ()
{
	FunctionStarterHelper;
	SelectedOptionHelper "Entrer dans le terminal";
	echo -e "\nVous allez être connecté au terminal... Veuillez patienter.\n"; sleep 0.5;
	newLog command "Annulation du logiciel, entrée dans le terminal, date: $(date).";
	StopExecutionHelper;
}