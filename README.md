## :toolbox: Getting Started

**Cloner le projet**

```
# HTTPS
git clone https://github.com/AlxisHenry/lamp-server-tools.git my-server
```

**Se rendre dans le dossier du projet**

```bash
cd my-server
```

**Créer le fichier `.env`**

```bash
cp .env.example .env
```

**Configurer le fichier `.env`**

```bash
bash config/.env.sh
```

**Lancer le script de mise en place du projet**

```bash
bash server.sh maintaining [OPTION...]
```

**Options**

`--skip` : Lancer le script sans prendre en compte les `sleep`.

**Automatisation du lancement du script au démarrage d'un nouveau terminal**

```bash
bash config/config.sh bashrc
```

**Création d'un alias temporaire pour l'exécution du programme**

```bash
bash config/aliases.sh create
```

## :wave: Auteurs

* **Alexis Henry** _alias_ [@AlxisHenry](https://github.com/AlxisHenry)
