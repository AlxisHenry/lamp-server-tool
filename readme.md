0)  Déconnecter la session [ Command: LogoutCommand() ]

1)  Entrer dans le terminal [ Command: EnterShellCommand() ]

2)  Mettre à jour le projet [ Command: UpdateApplicationCommand() ]

3)  Réinitialiser le projet [ Command: SetupApplicationCommand() ]

4)  Modifier le fichier de configuration [ Command: EnvApplicationCommand() ]

5)  Paramètres de Postfix { Settings: PostfixSettings() }
	a) Redémarrer Postfix [ Command: RestartServicesCommand($service) ]
	b) Changer le port SMTP [ Command:  ]
	c) Modifier les identifiants SMTP [ Command:  ]
	d) Envoyer un email de test [ Command:  ]

6)  Paramètres d'Apache { Settings: ApacheSettings() }
	a) Redémarrer Apache [ Command: RestartServicesCommand($service) ]

7)  Paramètres du gestionnaire de base de données { Settings: DatabaseSettings() }
	a) Voir les bases de données [ Command:  ]
	b) Voir les tables d'une base de données [ Command:  ]
	
8)  Redémarrer un service { Settings: ServicesSettings() }
	a) Redémarrer Apache  [ Command: RestartServicesCommand($service) ]
	b) Redémarrer MariaDB [ Command: RestartServicesCommand($service) ]
	c) Redémarrer Postfix [ Command: RestartServicesCommand($service) ]

9)  Redémarrer le serveur [ Command: RestartServerCommand() ]

Modification fichier :

cat du fichier
user input type : [ Anciennne valeur a modifié ] / [ Nouvelle valeur ]