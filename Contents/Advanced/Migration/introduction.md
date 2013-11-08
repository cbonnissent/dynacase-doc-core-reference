# Migration de modules {#core-ref:d2bd57f9-7b5a-46b0-8570-6b5b0710d7c3}

## Scripts de pré-migration et de post-migration {#core-ref:fd259229-b279-469a-8e3c-d737fabcf9d5}

Lors de la mise à jour d'un module, il est possible d'exécuter des scripts pour
effectuer des opérations de migrations ou des traitements spécifiques.

Ces scripts de migration ne peuvent être utilisés que dans le cadre de **mise à
jours d'application**. Un module sans application ne peut pas utiliser cette
mécanique de migration.

Deux types de scripts sont possibles :

*   scripts de pré-migration (premigr) : les scripts de pré-migration (premigr) sont prévus pour être exécutés avant que l'application et les familles en base de données soient mis-à-jour.
*   scripts de post-migration (postmigr) : les scripts de post-migration (postmigr) sont prévus pour être exécutés après que l'application et les familles en base de données aient été mis-à-jour.

Les scripts doivent être situés dans le sous-répertoire de l'application et leur
nom doit être de la forme :

*   scripts de pré-migration (premigr) : `${APPNAME}_premigr_${VERSION}`
*   scripts de post-migration (postmigr) : `${APPNAME}_postmigr_${VERSION}`

NOTE : les scripts de migration sont exécutés sur des changements de VERSION
sans tenir compte des RELEASE. On ne peut donc pas exécuter de script de
migration lors d'un changement de RELEASE.

Le lancement de ces scripts est commandé dans le fichier `info.xml` du module
par l'utilisation d'une directive 
`<process command="programs/(pre|post)_migration ${APPNAME}" />` 
dans la section `<post-upgrade/>`.

Exemple de déclaration type pour le lancement de scripts de pré-migration et de
post-migration :

    [xml]
    <module name="FOO" version="2.0.0" release="1">
      ...
      <post-upgrade>
        <process command="programs/pre_migration FOO" />
        <process command="programs/record_application FOO" />
        <process command="programs/app_post FOO U" />
        <process command="programs/post_migration FOO" />
        <process command="programs/update_catalog" />
      </post-upgrade>
    </module>

Les programmes `pre_migration` et `post_migration' exécutent tous les scripts de
"premigr" ou "postmigr" dont la version est comprise entre la version de
l'application actuellement installé, et la version de l'application mise-à-jour.

Les scripts de migration doivent être exécutable.

## Variables d'environnement {#core-ref:de62dd12-c82f-4856-ab17-7498b698012a}

Lorsque les scripts "premigr" et "postmigr" sont exécutés, les variables
d'environnement suivantes sont disponibles :

|       Variable      |                                                                          Valeur                                                                         |           Exemple           |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| wpub                | Le chemin d'accès au contexte sur lequel est effectué la mise-à-jour.                                                                                   | "/var/www/dynacase"         |
| httpuser            | L'UID du process httpd/Apache.                                                                                                                          | "www-data"                  |
| pgservice_core      | Le nom du service PostgreSQL d'accès à la base de données Dynacase.                                                                                     | "dynacase"                  |
| MODULE_VERSION_FROM | La version du module actuellement installée (de la forme "VERSION-RELEASE"). <br/>Cette version n'est pas forcément égale à la version de l'application | "1.2.3-4"                   |
| MODULE_VERSION_TO   | La nouvelle version du module (de la forme "VERSION-RELEASE").                                                                                          | "2.3.4-5"                   |
| WIFF_CONTEXT_NAME   | Le nom du contexte sur lequel est effectué la mise-à-jour.                                                                                              | "dynacase"                  |
| WIFF_CONTEXT_ROOT   | Le chemin d'accès au contexte sur lequel est effectué la mise-à-jour.                                                                                   | "/var/www/dynacase"         |
| WIFF_ROOT           | Le chemin d'accès au répertoire dans lequel est installé dynacase-control.                                                                              | "/var/www/dynacase-control" |


## Comparaison de versions {#core-ref:4a003255-f158-4192-b09d-8d203ed612ba}

Il peut être nécessaire, pour un script de migration, d'effectuer des opérations
différentes en fonction de la version de départ du module. Pour cela, la
variable d'environnement `$MODULE_VERSION_FROM` peut-être utilisée pour obtenir
la version du module actuellement installé. Ensuite, pour comparer des versions
représentés sous forme de chaîne de caractères, il vous faudra utiliser la
fonction bash `versionCompare` déclarée dans le fichier bash `$wpub/libutil.sh` :

Syntaxe :

    [bash]
    versionCompare $V1 $V2

La fonction prend deux arguments, qui sont les versions à comparer, et affiche
sur STDOUT un entier : inférieur à 0 si $V1 est inférieur à $V2 supérieur à 0 si
$V1 est supérieur à $V2 égal à 0 si $V1 est égal à $V2

Il faut ensuite utiliser les opérateurs de comparaison arithmétique ("-lt",
"-gt", "-le", "-ge", "-eq", "-ne") de bash :

    [bash]
    #!/bin/bash
    
    . "$wpub/libutil.sh"
    
    CMP=$(versionCompare "$MODULE_VERSION_FROM" "1.0.0")
    if [ $CMP -lt 0 ]; then
      echo "La version de départ est inférieure à 1.0.0"
    else
      echo "La version de départ est supérieure ou égale à 1.0.0"
    fi
    
Note : Dans le cas de script PHP, la fonction `version_compare` de PHP permet de
réaliser aussi la comparaison de version.
