# Organisation des instructions d'importation des familles/documents {#core-ref:15717d28-034c-466c-91be-0dee27b636d5}

Les contrôles d’importation vérifient la validité des différentes structures et
des relations entre les documents.

L’ordre que nous préconisons est le suivant :

| Définition                                       | Description de l’opération                                                                                                                                                                                                                                                                                                  |
| -                                                | -                                                                                                                                                                                                                                                                                                                           |
| Définition de l’application                      | Instructions de définition de l’application. <br> Lors de l’installation, l'instruction se résume à `<process command="programs/record_application APPNAME"/>`. <br> Lors de l’upgrade, elle devient `<process command="programs/pre_migration APPNAME"/>` `<process command="programs/record_application APPNAME"/>` |
| Groupes et utilisateurs                          | Document qui importe les groupes et les utilisateurs utilisés dans cette application                                                                                                                                                                                                                                        |
| Droits                                           | Document associant les droits spécifiques à l’application (ACL) aux groupes et aux utilisateurs importés auparavant                                                                                                                                                                                                         |
| Famille(s) père(s)                               | Si la famille en cours possède une famille père qui n’est pas déjà existante, vous devez l’importer avec l’ensemble de ses dépendances                                                                                                                                                                                      |
| Structure de la famille en cours                 | Uniquement la structure de la famille en terme d’attributs/paramètres                                                                                                                                                                                                                                                       |
| Famille de workflow                              | Définition de la famille de workflow associée à la famille en cours.                                                                                                                                                                                                                                                        |
| Paramétrage du workflow                          | Documents de workflow et de paramétrage associés (profils dédiés, masques, timers…)                                                                                                                                                                                                                                         |
| Paramétrage de la famille                        | Documents associés à la famille (profil de document, profil de famille, contrôle dédié, etc...)                                                                                                                                                                                                                             |
| Propriétés de la famille                         | Ensemble des propriétés de la famille (icône, label, référence du profil de famille, référence du profil de document par défaut, référence du contrôle de vue, référence du cycle de vie associé…)                                                                                                                          |
| Documents de la famille en cours                 | Éventuels documents de la famille en cours d’importation                                                                                                                                                                                                                                                                    |
| Famille(s) suivante(s)                           | Autres familles de l’application, éventuellement héritant de la famille en cours                                                                                                                                                                                                                                            |
| Lancement des scripts d'upgrade de l'application | `<process command="programs/post_migration APPNAME" />`                                                                                                                                                                                                                                                                   |
| Regénération des catalogues de langues           | `<process command="programs/update_catalog" />`                                                                                                                                                                                                                                                                             |
| Instructions diverses                            | Toutes les instructions spacifiques à votre projet                                                                                                                                                                                                                                                                          |

Cela donne le XML suivant :

    [xml]
    <?xml version="1.0"?>
    
    <module name="foo" version="1.0.0" release="42">
    
       <!-- Label of the application displayed in dynacase control only -->
       <description>My application name</description>
       
       <!-- Module required with version for the installation/upgrade -->
       <requires>
           <module name="dynacase-platform" version="3.2.0" comp="ge"/>
       </requires>
    
       <!-- Install instruction -->
       <post-install>
           <process command="programs/record_application APPNAME"/>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/GROUPS.ods">
               <label lang="en">Importing GROUPS.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/RIGHT.ods">
               <label lang="en">Importing RIGHT.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/STRUCT_famille_A.ods">
               <label lang="en">Importing STRUCT_famille_A.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/PARAM_famille_A.ods">
               <label lang="en">Importing PARAM_famille_A.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/PROPERTY_famille_A.ods">
               <label lang="en">Importing PROPERTY_famille_A.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/STRUCT_famille_B.ods">
               <label lang="en">Importing STRUCT_famille_B.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/WFL_famille_B.ods">
               <label lang="en">Importing WFL_famille_B.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/PARAM_WFL_famille_B.ods">
               <label lang="en">Importing PARAM_WFL_famille_B.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/PARAM_famille_B.ods">
               <label lang="en">Importing PARAM_famille_B.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/PROPERTY_famille_B.ods">
               <label lang="en">Importing PROPERTY_famille_B.ods</label>
           </process>
           <process command="./wsh.php --api=importDocuments --file=./APPNAME/DOC_famille_B.ods">
               <label lang="en">Importing DOC_famille_B.ods</label>
           </process>
           <process command="programs/post_migration APPNAME"/>
           <process command="programs/update_catalog"/>
       </post-install>
    
       <post-upgrade>
           <process command="programs/pre_migration APPNAME"/>
           <process command="programs/record_application APPNAME"/>
    
           <!-- Same content as the content between record and post migration of the install part above -->
    
           [...]
    
           <process command="programs/post_migration APPNAME"/>
           <process command="programs/update_catalog"/>
       </post-upgrade>
    
    </module>

## Scripts de commande fournis par `dynacase-core` {#core-ref:5e92e062-ef9e-4f2f-9bbb-3384ed07ed52}

Le module `dynacase-core` fournit un ensemble de scripts dans le sous-
répertoire `programs`.

### Commande *programs/app_post* {#core-ref:cc8bc194-900b-427a-9f5c-f4b629e81daa}

Prototype :

* `programs/app_post <APPNAME> I|U`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :

* Dans la phase `post-install`, le programme doit être exécuté
  avec le programme `record_application`
* Dans la phase `post-upgrade`, le programme doit être exécuté
  après `pre_migration` et avant le programme `record_application`

Le programme `app_post` recherche et exécute, s'il est présent, le script
`./<APPNAME>/<APPNAME>_post` qui peut contenir des instructions pour un
traitement d'initialisation ou d'upgrade particulière.

Le module peut donc fournir son propre script nommé
`./<APPNAME>/<APPNAME>_post` qui sera exécuté par l'appel à
`programs/app_post`.

Les arguments sont :

* Le nom de l'application (le script exécuté sera alors &lt;APPNAME&gt;_post)
* `I` | `U` : Le nom de la phase d'initialisation a exécuter (`I` pour install, `U` pour upgrade)

Exemple :

    [xml]
    <post-install>
      <process command="programs/app_post WEBDESK I" />
      [...]
    </post-install>
    <post-upgrade>
      [...]
      <process command="programs/app_post WEBDESK U" />
      [...]
    </post-upgrade>

Le script `<APPNAME>_post` est alors exécuté par `app_post` avec un seul
argument qui est l'argument `I` ou `U` suivant qu'on est dans une installation
ou un upgrade.

    "programs/app_post FOO I" --(execute)--> "FOO/FOO_post I"

### Commande *programs/record_application* {#core-ref:c695dfd3-dcf6-4d52-a72e-ec95cb15450e}

Prototype :

* `programs/record_application <APPNAME>`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté après le programme `app_post`

Le programme `record_application` est utilisé pour enregistrer, ou mettre à
jour, la définition de l'application en base de données.

La ligne de commande est spécifié par l'attribut `command`.

`record_application` prend en argument le nom de l'application à enregistrer.

Exemple :

    [xml]
    <process command="programs/record_application FOO" />

### Commande *programs/update_catalog* {#core-ref:a3b5b826-2476-4602-8772-4c8e264de1ed}

Prototype :

* `programs/update_catalog`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté à la fin de la phase

Le programme `update_catalog` est utilisé pour ré-générer le catalogue des
messages de localisation.

Exemple :

     [xml]
    <process command="programs/update_catalog" />

### Commande *programs/pre_migration* {#core-ref:1dbb94a3-763f-46f7-bb2d-d7029dcf8592}

Prototype :

* `programs/pre_migration`

Utilisable dans les phases :

* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté au début de la phase, avant le programme
  `app_post`

Le programme `pre_migration` est utilisé pour exécuter les scripts de
pre-migration d'un module lors de sa mise-à-jour.
 
Exemple :
 
     [xml]
    <process command="programs/pre_migration" />

### Commande *programs/post_migration* {#core-ref:6a525876-dac7-40c3-8f87-01a9bec64837}
 
Prototype :
 
* `programs/post_migration`
 
Utilisable dans les phases :
 
* `post-upgrade`
 
Conditions d'utilisation :
 
* Le programme doit être exécuté après le programme `record_application`, et
  avant le `update_catalog`
 
Le programme `post_migration` est utilisé pour exécuter les scripts de
post-migration d'un module lors de sa mise-à-jour.
 
Exemple :
 
     [xml]
    <process command="programs/post_migration" />

### Commande *programs/set_param* {#core-ref:39167ac3-e1e7-4d07-a784-ef9f365a6457}

Prototype :
 
* `programs/set_param <DYNACASE_PLATFORM_PARAM_NAME> <DYNACASE_CONTROL_MODULE_PARAM_NAME>`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Le programme `programs/set_param` permet de positionner la valeur d'un
paramètre applicatif de dynacase-platform avec la valeur d'un paramètre de
module.

Exemple :
 
     [xml]
    <parameters>
      <param name="foo_client_name" label="Client name" type="text" default="ACME" onupgrade="W"/>
    </parameters>
    
    <post-install>
      [...]
      <process command="programs/set_param CORE_CLIENT foo_client_name" />
      [...]
    </post-install>

### Commande *wsh.php* {#core-ref:b7ad8be9-55d9-48e3-80e4-9245d6f4f345}

Prototype :

* `wsh.php`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :
 
* Le programme peut être utilisé à n'importe quel moment en fonction des
  besoins

Le programme `wsh.php` est utilisé pour exécuter des méthodes sur des classes
documentaires et exécuter des API Dynacase.

Exemple :
 
    [xml]
    <process command="wsh.php --api=refreshDocuments --method=postModify --famid=FOO" />
