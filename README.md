# Shopeasy API

## Installation de l'API
Déposez l'ensemble des fichiers de l'API dans un répertoire de serveur Apache. Dans ce répertoire, la réecriture d'URL via fichier .htaccess doit être autorisée.

## Installation de la base de données pour l'API
Créez une nouvelle base de données MySQL "shopeasy" et importez-y le fichier shopeasy.sql

## Configuration de l'API
Modifiez le fichier libs/config.php de l'API avec les informations permettant d'accéder à la base de données précédemment crée.

## Tester l'API
Allez sur localhost/shopeasy-api/
Il devrait s'afficher : 
```
{"version":1.1,"success":false,"status":400}
```
Allez sur localhost/shopeasy-api/shops
Il devrait afficher la liste des magasins de la BDD :
```
{"version":1.1,"success":true,"status":200,"shops":[{"id":"1","name":"Auchan V2","urlMap":"maps\/1.jpg","mapScale":"200"}]}
```

