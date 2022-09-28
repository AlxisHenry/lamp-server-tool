Logs {

	- Insert dans les fichiers de log
	- Affichage de logs
	- Recherche dans les logs?

}

Apache {

	- Reload apache => ReloadServices()
	- Restart apache => RestartServices()
	- Lister les fichiers de configuration
	- Faire des modifications dans un fichier de configuration

}

Postfix {

	- Restart postfix => RestartServices()
	- Test d'envoi d'email => FakeEmailSent()
	- Reconfigurer les identifiants => ConfigurePostfixIdentifier()
	- Reconfigurer le port smtp => ConfigurePostfixSmtp()

}

BDD {

	- Restart Mariadb => RestartServices()
	- Dump d'une base de données
	- Voir les base de données / tables d'une bdd

}

Application {

	- Mettre à jour le code => UpdateApplication()
	- Réinitialisation du projet? => SetupApplication()
	- Modifier le fichier .env

}

Global {

	- Entrer dans le terminal => StopMaintaining()
	- Redémarrer le serveur => RestartServer()

}
