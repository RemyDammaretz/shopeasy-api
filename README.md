# Shopeasy API
J'ai rempli par défaut un peu la bdd mais les données seront à changer
## Installation de l'API

Installer Wampserver
Télécharger le dépot git dans le dossier d'installation de Wamp wamp64/www/

## Installation de la base de données pour l'API

Lancer le serveur WAMP (ça crée une icone WAMP dans la barre des taches, en cliquant dessus on peut arrêter le service ou le démarrer, il faut qu'il soit démarré (icone verte))

Aller votre navigateur web et aller sur l'url localhost/phpmyadmin et se connecter (je ne sais plus si WAMP demande de configurer des identifiants a l'installation ou non, si il ne le demande pas ça doit être un pseudo et un mot de passe par défaut)

Créer une nouvelle base de données avec pour nom "shopeasy" (laisser les autres paramètres par défaut)
Aller sur cette base de données (menu à gauche)
Aller dans "Importer" (menu horizontal en haut de la page) et importer le fichier shopeasy.sql qui se trouve dans le dossier de l'API

## Configuration de l'API
Modifier le fichier libs/config.php de l'API avec vos identifaints de phpmyadmin


## Tester l'API
Aller sur localhost/shopeasy-api/
Il devrait s'afficher : 
```
{"version":1.1,"success":false,"status":400}
```
Aller sur localhost/shopeasy-api/shops
Il devrait afficher la liste des magasins de la BDD :
```
{"version":1.1,"success":true,"status":200,"shops":[{"id":"1","name":"Auchan V2","urlMap":"maps\/1.jpg","mapScale":"200"}]}
```

