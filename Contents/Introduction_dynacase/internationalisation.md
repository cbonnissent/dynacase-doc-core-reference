# Internationalisation

## Résumé

Dynacase comprend un mécanisme permettant la traduction de l'ensemble des labels et quelques formats de données pour s'adapter à la langue de l'utilisateur.  
Par défaut, il y a deux langues qui sont mises à disposition : le français et l'anglais.

En plus des labels, le format de la date est présenté différemment suivant la locale de l'utilisateur.

## Mécanisme de traduction

Le mécanisme de traduction est mis en place autour de l'outil [gettext](https://fr.wikipedia.org/wiki/Gettext) et son implémentation au sein de PHP.

Cet outil permet deux choses :

* lors du développement : la création de catalogues de traduction en extrayant les clefs directement du code PHP,
* lors de l'exécution : la récupération de la traduction d'une clef par rapport à la locale en cours.

Le mise en place des traduction lors du développement d'une application passe donc par les étapes suivantes :

1. Utilisation de l'API pour indiquer les éléments dont la traduction est nécessaire, soit via :
    
    * pour le code PHP, la fonction [_](http://php.net/manual/en/function.gettext.php).
    * pour le code javascript, la fonction `_` de l'api DATA.
2. Extraction des clefs du code et construction des catalogues. Cette partie est soit manuelle, soit instrumentée à l'aide des outils de build des modules Dynacase.
3. Déploiement du catalogue sur le serveur. Lors de la mise à jour du serveur applicatif, il faut fusionner les nouvelles définitions provenant du catalogue avec celles déjà en place.
4. Lors de l'exécution du programme, lorsque le code passe par une méthode utilisée lors de l'étape 1, il va chercher dans les définitions définies sur la plate-forme pour afficher la traduction pour la locale en cours.

## Mécanisme de mise à jour des paramètres régionaux

L'ajout de nouveaux paramètres régionaux (format de date, d'heure, etc.) passe par la mise à jour d'un fichier de configuration sur la plate-forme.