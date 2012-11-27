# Internationalisation {#core-ref:1de9ba03-a3b6-4b56-bfbe-62ce991f8ca1}

## Résumé {#core-ref:59fb5d82-b856-4647-8e5a-6f5d7d24085d}

Dynacase comprend un mécanisme permettant l'internationalisation de l'application. Celui-ci permet de :

* traduire l'ensemble des labels présentés dans l'interface,
* présenter la date en fonction de la locale de l'utilisateur.
 
Par défaut, il y a deux langues qui sont mises à disposition : le français et l'anglais.

## Mécanisme de traduction {#core-ref:0a83efc3-e8b6-475c-a265-09b8e3cc31a6}

Dynacase utilise le mécanisme standard de traduction [gettext](https://fr.wikipedia.org/wiki/Gettext) et son implémentation en PHP ([php-gettext](http://docs.php.net/manual/en/book.gettext.php)) pour la gestion des traductions des messages.

Cet outil permet deux choses :

* lors du développement : la création de catalogues de traduction en extrayant les clefs directement du code PHP,
* lors de l'exécution : la récupération de la traduction d'une clef par rapport à la locale en cours.

La mise en place des traductions lors du développement d'une application passe donc par les étapes suivantes :

1. *Utilisation de l'API pour indiquer les éléments dont la traduction est nécessaire*.  Ceci se fait soit via :
    
    * pour le code PHP, la fonction [`_()`](http://php.net/manual/en/function.gettext.php);
    * pour le code javascript, la fonction `_()` de l'api DATA;
    * pour les fichier de configuration des mots clefs spécifique au fichier.
2. *Extraction des clefs du code et construction des catalogues*.  Cette partie est soit manuelle, soit instrumentée à l'aide des outils de build des modules Dynacase.
3. *Déploiement du catalogue sur le serveur*.  Lors de la mise à jour du serveur applicatif, il faut fusionner les nouvelles définitions provenant du catalogue avec celles du catalogue principal.
4. *Lors de l'exécution du programme*.  lorsque le code passe par une méthode utilisée lors de l'étape 1, il va chercher dans le catalogue principal de la plate-forme le message traduit correspondant à la clef.

## Mécanisme de mise à jour des paramètres régionaux {#core-ref:cd3722a8-0d12-493a-aca1-af262e539d40}

L'ajout de nouveaux paramètres régionaux (format de date, d'heure, etc.) passe par la mise à jour d'un fichier de configuration sur la plate-forme.