# Installation et ou mise à jour d'applications et de familles {#core-ref:6556b95c-7513-478e-8750-1cbc6c4f6e6d}

## Introduction {#core-ref:bc3ef0a5-cd6e-4837-885c-3fba4f54fe64}

Le déploiement d'une application (ou d'une famille) est le terme utilisé pour le
processus d'installation d'applications (ou de familles) dans un contexte
Dynacase.

Le déploiement s’effectue à l'aide de dynacase-control soit en mode Web soit en
mode CLI en installant un module.

Un module est une archive dans un format spécifique (nommé `webinst`) qui
contient les éléments à déployer et les directives pour l'initialisation et/ou
le chargement de ces éléments.

Techniquement, un module est une archive TAR compressée GZIP avec l'extension
`.webinst` qui contient les fichiers suivants :

Un fichier `content.tar.gz`
:   Ce fichier est une archive TAR compressée GZIP contenant l'ensemble des
    fichiers (applications et familles) à déployer dans le contexte Dynacase.
    
    Cette archive contient donc tous les fichiers qui seront déployés dans le
    contexte, les chemins de ces fichiers sont relatifs à la racine du contexte
    et suivent l'organisation et la
    [structure d'un contexte Dynacase](#core-ref:0081bf38-3c37-47e5-9c39-70579214abdd).

Un fichier `info.xml`
:   Ce fichier contient les informations sur le module (nom, version, etc.) et
    les directives d'initialisation et/ou de chargement des éléments livrés par
    `content.tar.gz` ci-dessus.

Voir :

* [Format des modules webinst][webinst]

## Structure d'un contexte Dynacase {#core-ref:0081bf38-3c37-47e5-9c39-70579214abdd}

Un contexte Dynacase suit une structure déterminée de répertoires.

`<context-root>`
:   La racine du contexte contient les fichiers `index.php` et `admin.php` qui
    sont les points d'entrés pour l'accès Web à Dynacase.
    
    Vous n'avez pas à livrer de contenu dans la racine même du contexte.

`<context-name>/<APPNAME>`
:   Les répertoires en majuscules (e.g. `MYAPP`) dans la racine du contexte
    contiennent les fichiers des applications Dynacase.
    
    C'est dans ces répertoires que vous devez livrer les fichiers de classe de
    vos familles, les fichiers d'actions et les layouts de vos applications.
    
    Voir :
    
    * [Écrire une application][write_an_application]

`<context-root>/EXTERNALS`
:   Ce répertoire contient les fichiers d'aides à la saisie.
    
    C'est dans ce répertoire que vous devez livrer les fichiers d'aides à la
    saisie de vos familles.
    
    Voir :
    
    * [Les aides à la saisie][inputhelp]

`<context-root>/API`
:   Ce répertoire contient les scripts d'API exécutables par la commande CLI
    [`wsh`][wsh].
    
    C'est dans ce répertoire que vous devez livrer vos scripts d'API. 
    
    Voir :
    
    * [`wsh`][wsh]

`<context-root>/Images`
:   Ce répertoire contient les icônes des familles.
    
    C'est dans ce répertoire que vous devez livrer les icônes de vos familles.
    
    Voir :
    
    * [Définition de propriétés de famille > ICON][fam_icon]

`<context-name>/locale/fr/LC_MESSAGES/src` et `<context-root>/locale/en/LC_MESSAGE/src`
:   Ce répertoire contient les fichiers source (`<APPNAME>.po`) de localisation
    des applications.
    
    C'est dans ce répertoire que vous devez livrer vos fichiers source de
    localisation `.po`.
    
    Voir :
    
    * [Internationalisation][i18n]

## Déploiement des applications {#core-ref:838e7748-b4e1-4288-a8cb-6653ba50a799}

### Architecture de l'application sur le serveur {#core-ref:bbdfcd68-a42b-4718-b35c-5748e2bf23c7}

Comme vue précédemment dans
[structure d'un contexte Dynacase](#core-ref:0081bf38-3c37-47e5-9c39-70579214abdd),
une application est composée d'un répertoire nommé avec le nom de l'application
en majuscule.

Ce répertoire `MYAPP` doit contenir au moins :

Un fichier `MYAPP.app` (nom de l'application en majuscule + extension `.app`)
:   contenant la déclaration du nom, description, etc. de l'application
    (variable [`$app_desc`][app_desc]) et les éventuelles actions de
    l'application (variable [`$action_desc`][action_desc]).
    
    Exemple fichier `MYAPP/MYAPP.app` :
    
        [php]
        <?php
        
        $app_desc = array(
            "name"        => "MYAPP",
            "short_name"  => "Mon application",
            "description" => "Mon application de test",
            "icon"        => "myapp.png",
            "displayable" => "Y",
            "childof"     => "ONEFAM"
        );
        
        $action_desc = array(
            array(
                "name"       => "MYACTION1",
                "short_name" => N_("MYAPP:action one"),
                "acl"        => "MYAPPACL1"
                "root"       => "Y"
            )
        );

Un fichier `MYAPP_init.php` (nom de l'application en majuscule + `_init.php`)
:   contenant la version et la déclaration des éventuels paramètres de
    l'application (variables [`$app_const`][app_const]).
    
    Exemple fichier `MYAPP/MYAPP_init.php` :
    
        [php]
        <?php
        
        $app_const = array(
            "VERSION" => "1.0.3-1", // Paramètre minimum obligatoire
            "MYAPP_PARAM_FOO" => array(
                "val" => "1",
                "descr" => N_("MYAPP:Description of parameter foo"),
                "global" => "Y",
                "user" => "N"
            )
        );

L'icône `myapp.png` référencée par la variable [`$app_desc['icon']`][app_desc]
est à placer dans le répertoire `MYAPP/Images`.

Le fichier `MYAPP/myaction1.php` de l'action `MYACTION1` déclarée :

    [php]
    <?php
    
    function myactions1(Action & $action) {
        $action->lay->eSet("MESSAGE", "Hello world.");
    }

Le fichier de layout `MYAPP/Layout/myaction1.xml` de l'action `MYACTION1` :

    [html]
    <html>
    <title>My Action 1</title>
    <body>
    <p>[MESSAGE]</p>
    </body>
    </html>

Si l'application est localisée, alors les fichiers de locale doivent être dans
le sous-répertoire `locale` en suivant le format [`GNU gettext`][gnu_gettext]
décrit dans le chapitre [`Internationalisation`][i18n].

Exemple fichier `locale/en/LC_MESSAGES/src/MYAPP.po` :

    msgid ""
    msgstr ""
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=n>1\n"
    
    msgid "MYAPP:Description of parameter foo"
    msgstr "Paramètre foo"
    
    msgid "MYAPP:action one"
    msgstr "Action Un"

Exemple fichier `locale/fr/LC_MESSAGES/src/MYAPP.po` :

    msgid ""
    msgstr ""
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=n>1\n"
    
    msgid "MYAPP:Description of parameter foo"
    msgstr "Parameter foo"
    
    msgid "MYAPP:action one"
    msgstr "Action One"

Une fois la structure de l'application établie, vous pouvez générer l'archive
`content.tar.gz` avec le contenu de votre application (répertoire `MYAPP`) et
les éventuelles locales (répertoire `locale`).

Remarques :

* La notion de modules et de versions de modules n'a de sens qu'au sein de
dynacase-control. De la même manière, la notion d'applications et de versions
d'applications n'a de sens qu'au sein de Dynacase.
* La version de l'application peut ne pas être la même que la version du module.
* Un module d'une version donnée peut livrer plusieurs applications avec chacune
leur version distincte.
* C'est la version de l'application est utilisée pour déclencher les scripts de
pre-migration et de post-migration (voir
[Mettre à jour une application][mettre_a_jour_une_application] ci-dessous).

Voir :

* [Applications et actions][applications_et_actions]
* [Internationalisation][i18n]
* [Mettre à jour une application][mettre_a_jour_une_application]

### Enregistrer une application {#core-ref:3399cada-57dd-4501-87a0-e1435daf36d1}

Une fois les fichiers à livrer empaquetés dans l'archive `content.tar.gz`, il
faut créer le fichier `info.xml` avec les instructions nécessaires au chargement
de ces éléments.

Après que l'application contenue dans l'archive `content.tar.gz` ait été
décompressée dans le contexte, il faut enregistrer cette dernière auprès de
Dynacase lors de l'installation du module et lors de l'upgrade du module.

L'enregistrement d'une application auprès de Dynacase s'effectue à l'aide de la
commande [`program/record_application`][programs_record_application] qui
prend en argument :

`<APPNAME>`
:   Le nom de l'application que l'on souhaite enregistrer.

`I` ou `U`
:   `I` pour l'enregistrement lors de l'installation (*I*nstall) et `U` pour
    l'enregistrement lors de la mise à jour (*U*pgrade).

Cette commande ne peut être exécutée que dans l'environnement de dynacase-
control. Voir [Exécution manuelle][programs_exec_env] ci-dessous pour exécuter
manuellement ces commandes.

Si des catalogues de locales sont livrées, il faut alors les prendre en compte à
l'aide de la commande [`programs/update_catalog`][programs_update_catalog] (qui
ne prend pas d'arguments).

Exemple de fichier `info.xml` :

    [xml]
    <xml version="1.0" encoding="utf-8">
    <module name="my-module" version="1.0.3" release="1">
        
        <requires>
            <module name="dynacase-core" comp="ge" version="3.2.0" />
        </requires>
        
        <post-install>
            <process command="programs/record_application MYAPP I" />
            <process command="programs/update_catalog" />
        </post-install>
        
    </module>

Enfin, on peut générer le module final `my-module-1.0.3-1.webinst` en
empaquetant le fichier `content.tar.gz` et le fichier `info.xml`.

Voir :

* [Format des modules webinst][webinst]
* [`programs/record_application`][programs_record_application]
* [`programs/update_catalog`][programs_update_catalog]

### Mettre à jour une application {#core-ref:15298258-e0ef-42ab-9fed-d9ac061e294c}

On dit qu'un module est mis à jour lorsque la version déclarée dans la propriété
`version` dans le fichier `info.xml` est supérieure à la version du module
actuellement installé.

Dans ce, c'est la section `<post-upgrade/>` qui est exécutée et non plus la
section `<post-install/>`.

Pour mettre à jour une application, lors de la mise à jour d'un module, il faut
alors ré-enregistrer l'application pour mettre à jour sa définition par rapport
au niveaux fichiers livrés (`<APPNAME>/<APPNAME>.app` et
`<APPNAME>/<APPNAME>_init.php`).

Pour cela il faut donc ajouter une section `<post-upgrade/>` dans le fichier
`info.xml` contenant les instructions nécessaires pour ré-enregistrer
l'application :

    [xml]
     <post-upgrade>
         <process command="programs/record_application MYAPP U" />
         <process command="programs/update_catalog"/>
     </post-upgrade>

Ce qui donne alors le fichier `info.xml` suivant :

    [xml]
    <xml version="1.0" encoding="utf-8">
    <module name="my-module" version="1.0.4" release="1">
        
        <requires>
            <module name="dynacase-core" comp="ge" version="3.2.0" />
        </requires>
        
        <post-install>
            <process command="programs/record_application MYAPP I" />
            <process command="programs/update_catalog" />
        </post-install>
    
         <post-upgrade>
             <process command="programs/record_application MYAPP U" />
             <process command="programs/update_catalog"/>
         </post-upgrade>
        
    </module>

Régénérer enfin le module avec la nouvelle version des éléments à déployer.

### Migrer une application {#core-ref:7d037380-8fba-409b-85e5-15cbbac187bf}

Dans certains cas, l'application peut nécessiter des traitements spécifiques en
base de donnée ou sur des fichiers.

Ces traitements sont alors appelés scripts de "migration" car il vont devoir
manipuler des éléments pour monter en version l'application depuis la version
actuellement installée et la nouvelle version qui est déployée.

Deux types de scripts sont possibles :

* scripts de pré-migration (premigr) : les scripts de pré-migration (premigr) 
  sont prévus pour être exécutés avant que l'application et les familles en base
  de données soient mis-à-jour,
* scripts de post-migration (postmigr) : les scripts de post-migration (postmigr) 
  sont prévus pour être exécutés après que l'application et les familles en base
  de données aient été mis-à-jour.

Les scripts doivent être situés dans le sous-répertoire de l'application et leur
nom doit être de la forme :

* scripts de pré-migration (premigr) : `<APPNAME>_premigr_<VERSION>`
* scripts de post-migration (postmigr) : `<APPNAME>_postmigr_<VERSION>`

Remarques :

* Un module sans application ne peut pas utiliser cette mécanique de migration.
* Le script peut être écrit dans n'importe quel langage que peut
exécuter la plateforme hébergeant le contexte sur lequel il est exécuté.
Toutefois, il ne doit pas avoir d'extension, il faut donc utiliser la 
notation [shebang][wikiShebang] en première ligne de script pour indiquer le 
langage d'exécution,
* les scripts de migration sont exécutés sur les changements de VERSION
sans tenir compte des RELEASE. On ne peut donc pas exécuter de script de
migration lors d'un changement de RELEASE,
* les scripts de migration doivent être exécutables.

Le lancement de ces scripts est commandé dans le fichier `info.xml` du module
par l'utilisation d'une directive 
`<process command="programs/{pre,post}_migration <APPNAME>" />` 
dans la section `<post-upgrade/>`.

Exemple de déclaration type pour le lancement de scripts de pré-migration et de
post-migration :

    [xml]
    <xml version="1.0" encoding="utf-8">
    <module name="my-module" version="1.0.5" release="1">
        
        <requires>
            <module name="dynacase-core" comp="ge" version="3.2.0" />
        </requires>
        
        <post-install>
            <process command="programs/record_application MYAPP I" />
            <process command="programs/update_catalog" />
        </post-install>
        
        <post-upgrade>
            <process command="programs/pre_migration MYAPP" />
            <process command="programs/record_application MYAPP U" />
            <process command="programs/post_migration MYAPP" />
            <process command="programs/update_catalog" />
        </post-upgrade>
      
    </module>

Les programmes [`programs/pre_migration`][programs_pre_migration] et
[`programs/post_migration`][programs_post_migration] exécutent tous les scripts
de "premigr" ou "postmigr" dont la version est comprise entre la version de
l'application actuellement installé, et la version de l'application mise-à-jour.

| Version sur le contexte  | Version dans le paquet     | Version du script    | Exécution  |
| ------------------------ | -------------------------- | -------------------- | ---------- |
| 1.0.0                    | 2.0.0                      |  1.1.0               |  Oui       |
| 1.0.0                    | 1.0.0                      |  1.0.0               |  Non       |
| 3.0.0                    | 2.0.0                      |  1.0.0               |  Non       |
| 1.0.0                    | 2.0.0                      |  1.0.0               |  Non       |
| 1.0.0                    | 2.0.0                      |  2.0.0               |  Oui       |

Voir :

* [`programs/pre_migration`][programs_pre_migration]
* [`programs/post_migration`][programs_post_migration]

## Déployer une famille {#core-ref:a593ffb9-e780-426c-9807-5af363ed4bb6}

### Organisation de la famille {#core-ref:573406ad-6c9a-41a3-b0cb-8fabdfe091d4}

Le déploiement et le paramétrage d'une famille implique l'utilisation de
fichiers de [`description de famille`][family_declaration] qui doivent être
chargés suivant un ordre déterminé.

En effet, un fichier d'import ne doit référencer que des éléments connus au
moment de son import. Par conséquent, il vous faut mettre en place un ordre de
chargement des éléments afin d'importer en premier lieu un fichier *N* qui
définirait les éléments qui seraient ensuite utilisés par les éléments définis
dans un fichier *N+1*, et ainsi de suite.

L'ordre de chargement des éléments doit généralement être du type :

* importer les données d'initialisation (e.g. utilisateurs, groupes et rôles) ;
* importer la structure des familles ;
* importer le paramétrage des familles (e.g. affecter les profils aux familles);

Pour éviter les références cycliques, comme dans le cas d'une famille qui
utilise un cycle qui lui même est dynamique sur la famille (donc référence à son
tour la famille), on procédera par l'import des familles seule (sans références
à leurs cycles), puis des cycles qui référencent les familles, et enfin par
l'import du paramétrage des familles qui va mettre en place leurs cycles.

### Installer une famille {#core-ref:b6cd36b5-9247-4025-8638-0c683bbb5f37}

Les fichiers de description des familles peuvent être placés dans le sous-
répertoire de l'application, ou bien, en l'absence d'application, dans un sous-
répertoire qui permettra d'éviter que les éléments déployés n'entrent en conflit
avec d'autres éléments.

Déclarer dans le fichier `info.xml` le chargement, et l'ordre de chargement, de
ces fichiers à l'aide de la commande `wsh.php --importDocuments` :

    [xml]
    <?xml version="1.0" encoding "utf-8"?>
    <module name="my-module" version="1.0.0" release="1">
    
        <post-install>
            <process command="wsh.php --api=importDocuments --file=MYFAMS/init_users.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/init_groups.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/init_roles.csv" />
            
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam1.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam2.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_fam1.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_fam2.csv" />
        </post-install>
        
        <post-upgrade>
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam1.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam2.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_fam1.csv" />
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_fam2.csv" />
        </post-upgrade>
    
    </module>

Générer le module avec l'archive `content.tar.gz` et le fichier `info.xml`.

### Mettre à jour une famille {#core-ref:63d397cd-b7e0-439a-a3d4-31e137d1ad40}

La mise à jour d'un famille se fait en important le nouveau fichier de
définition de famille.

Cependant, certains cas peuvent nécessiter une migration de données comme par
exemple dans le cas d'un attribut de type timestamp (qui regroupe date + heure)
qu'on voudrait migrer sous la forme de deux attributs distincts : un de type
date et l'autre de type time.

Dans ce cas il faut utiliser un script de migration afin de migrer la valeur de
l'attribut timestamp dans les deux attributs date et time à l'aide
d'instructions SQL.

Comme indiqué précédemment, pour pouvoir utiliser de tels scripts de migration,
il faut avoir une application afin de pouvoir déclencher les scripts de pré-
migration et de post-migration lorsque la version de l'application est modifiée.

Admettons que la nouvelle version de l'application soit la `2.0.0`, alors le
script de post-migration des familles doit être déclaré dans un script nommé
`MYAPP/MYAPP_postmigr_2.0.0`.

Exemple de script de post-migration `MYAPP/MYAPP_postmigr_2.0.0` (en Bash) pour
la migration d'un attribut de type timestamp sous la forme de deux attributs :

    [php]
    #!/usr/bin/env php
    <?php
    
    require('FDL/freedom_util.php');
    require('WHAT/Lib.Common.php');
    
    /*
     * Obtenir l'identifiant de la famille 'FAM_1'
     */
    $famId = getIdFromName('', 'FAM_1');
    if ($famId <= 0) {
        printf("Error: could not get id from name '%s'.\n", 'YUSER');
        exit(1);
    }
    
    /*
     * Mettre à jour la table de la famille MYFAM pour scinder les valeurs
     * 'attr_timestamp' dans deux attributs : 'attr_date' et 'attr_time'
     */
    printf("Migrating table 'doc%d'...\n", $famId);
    $sql = sprintf("UPDATE doc%d SET attr_date = attr_timestamp::date, attr_time = attr_timestamp::time", $famId);
    $err = simpleQuery('', $sql, $res, false, false, false);
    if ($err !== '') {
        printf("Error: %s\n", $err);
        exit(1);
    }
    printf("Done.\n");
    exit(0);

Rendre le script `MYAPP/MYAPP_postmigr_2.0.0` exécutable.

Régénérer l'archive `content.tar.gz` avec les éléments à livrer (`MYAPP` et
`MYFAMS`).

Fichier `info.xml` correspondant complet :

    [xml]
    <?xml version="1.0" encoding "utf-8"?>
    <module name="my-module" version="2.0.0" release="1">
        
        <requires>
            <module name="dynacase-core" comp="ge" version="3.2.0" />
        </requires>
        
        <post-install>
            <!-- Enregistrer l'application MYAPP -->
            <process command="programs/record_application MYAPP I" />
            
            <!-- Charger les familles -->
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam1.csv" />
            [...]
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_wdoc2.csv" />
            
            <!-- Mettre à jour le catalogue de langue -->
            <process command="programs/update_catalog" />
        </post-install>
        
        <post-upgrade>
            <!-- Lancer les scripts de pre-migration de l'application MYAPP -->
            <process command="programs/pre_migration MYAPP" />
            
            <!-- Enregistrer la nouvelle définition de l'application -->
            <process command="programs/record_application MYAPP" />
            
            <!-- Charger les nouvelles définitions des familles -->
            <process command="wsh.php --api=importDocuments --file=MYFAMS/struct_fam1.csv" />
            [...]
            <process command="wsh.php --api=importDocuments --file=MYFAMS/param_wdoc2.csv" />
            
            <!-- Lancer les scripts de post-migration de l'application MYAPP -->
            <process command="programs/post_migration MYAPP" />
            
            <!-- Mettre à jour le catalogue de langue -->
            <process command="programs/update_catalog" />
        </post-upgrade>
    
    </module>

Régénérer enfin le module avec la nouvelle version des éléments à déployer.

Le script `MYAPP/MYAPP_postmigr_2.0.0` est alors exécuté lors de l'upgrade du
module `my-module-2.0.0-1.webinst` lorsque la version installée de l'application
`MYAPP` est < `2.0.0`.

Remarques :

* En l'absence d'application, il n'est pas possible d'utiliser le mécanisme de
pre-migration et post-migration tel que décrit ci-dessus. Dans un tel cas, il
vous faudra, par exemple, livrer un script d'API et exécuter celui-ci avec une
directive `<process command="wsh.php --api=migrate-my-fams-2.0.0" />`.

Voir :

* [Migrer une application][migrer_une_application]
* [`programs/pre_migration`][programs_pre_migration]
* [`programs/post_migration`][programs_post_migration]

## Mettre à jour le catalogue de langue {#core-ref:2bd7f5fc-42b2-42b6-aab5-a19a7faa8712}

La mise à jour du catalogue de langue s'effectue en exécutant le programme
`program/update_catalog` en `post-install` et `post-upgrade`.

    [xml]
        <post-install>
            [...]
            <process command="program/update_catalog" />
        </post-install>
        
        <post-upgrade>
            [...]
            <process command="program/update_catalog" />
        </post-upgrade>

Voir :

* [`Internationalisation`][i18n]

## Programmes utiles pour les déploiements {#core-ref:ca90ee58-0590-4e4b-a3f5-5dcaf500ecda}

Un ensemble de programmes utiles pour les déploiements sont fournis par
dynacase-core dans le sous-répertoire `programs` du contexte Dynacase.

Ces programmes sont prévus pour être exécutés par dynacase-control et ne
peuvent donc pas être directement exécutés manuellement sans cet environnement.

Si vous souhaitez exécuter ces programmes manuellement, voir
[Exécution manuelle][programs_exec_env] ci-dessous.

### Commande *programs/app_post* {#core-ref:cc8bc194-900b-427a-9f5c-f4b629e81daa}

Prototype :

* `programs/app_post <APPNAME> I|U`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :

* Dans la phase `post-install`, le programme doit être exécuté
  après le programme [`record_application`][programs_record_application]
* Dans la phase `post-upgrade`, le programme doit être exécuté
  après [`pre_migration`][programs_pre_migration] et avant le programme
  [`record_application`][programs_post_migration]

Le programme `app_post` recherche et exécute, s'il est présent, le script
`<APPNAME>/<APPNAME>_post` qui peut contenir des instructions pour un
traitement d'initialisation ou d'upgrade particulière.

Le module peut donc fournir son propre script nommé
`<APPNAME>/<APPNAME>_post` qui sera exécuté par l'appel à
`programs/app_post`.

Les arguments sont :

* Le nom de l'application (le script exécuté sera alors
  `<APPNAME>/<APPNAME>_post`)
* `I` | `U` : Le nom de la phase d'initialisation a exécuter (`I` pour install,
  `U` pour upgrade)

Exemple :

    [xml]
    <post-install>
      [...]
      <process command="programs/record_application MYAPP I" />
      
      <process command="programs/app_post MYAPP I" />
      
      [...]
    </post-install>
    
    <post-upgrade>
      [...]
      <process command="programs/pre_migration MYAPP" />
      <process command="programs/record_application MYAPP U" />
      
      <process command="programs/app_post MYAPP U" />
      
      <process command="programs/post_migration MYAPP" />
      [...]
    </post-upgrade>

Le script `<APPNAME>/<APPNAME>_post` est alors exécuté par `app_post` avec un
seul argument qui est l'argument `I` ou `U` suivant qu'on est dans une
installation ou un upgrade.

    "programs/app_post MYAPP I" --(execute)--> "MYAPP/MYAPP_post I"

    "programs/app_post MYAPP U" --(execute)--> "MYAPP/MYAPP_post U"

### Commande *programs/record_application* {#core-ref:c695dfd3-dcf6-4d52-a72e-ec95cb15450e}

Prototype :

* `programs/record_application <APPNAME> I|U`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté après le programme
  [`app_post`][programs_app_post]

Les arguments sont :

* Le nom de l'application (correspondant aux fichiers
  `<APPNAME>/<APPNAME>_init.php` et `<APPNAME>/<APPNAME>.app`)
* `I` | `U` : Le nom de la phase d'initialisation a exécuter (`I` pour install,
  `U` pour upgrade)

Le programme `record_application` est utilisé pour enregistrer, ou mettre à
jour, la définition de l'application en base de données.

Exemple :

    [xml]
    <post-install>
      [...]
      
      <process command="programs/record_application MYAPP I" />
      
      [...]
    </post-install>
    
    <post-upgrade>
      [...]
      
      <process command="programs/record_application MYAPP U" />
      
      [...]
    </post-install>

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
    <post-install>
      [...]
      
      <proccess command="programs/update_catalog" />
    
    </post-install>
    
    <post-upgrade>
      [...]
      
      <process command="programs/update_catalog" />
    
    </post-upgrade>

### Commande *programs/pre_migration* {#core-ref:1dbb94a3-763f-46f7-bb2d-d7029dcf8592}

Prototype :

* `programs/pre_migration`

Utilisable dans les phases :

* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté au début de la phase, avant le programme
  [`app_post`][programs_app_post] et
  [`record_application`][programs_record_application].

Les arguments sont :

* Le nom de l'application

Le programme `pre_migration` est utilisé pour exécuter les scripts de
pre-migration (`<APPNAME>/<APPNAME>_premigr_<VERSION>`) d'un module lors de sa
mise-à-jour.

Tous les scripts `<APPNAME>/<APPNAME>_premigr_<VERSION>` dont la version est
supérieure à la version de l'application précédemment enregistré sont exécutes
dans l'ordre des versions.

Exemple :

    [xml]
    <post-upgrade>
      [...]
      
      <process command="programs/pre_migration MYAPP" />
      
      <process command="programs/record_application MYAPP U" />
      <process command="programs/app_post MYAPP U" />
      <process command="programs/post_migration MYAPP" />
      [...]
    </post-upgrade>

Voir :

* [Scripts de pré-migration et de post-migration][#core-ref:fd259229-b279-469a-8e3c-d737fabcf9d5]

### Commande *programs/post_migration* {#core-ref:6a525876-dac7-40c3-8f87-01a9bec64837}

Prototype :

* `programs/post_migration`

Utilisable dans les phases :

* `post-upgrade`

Conditions d'utilisation :

* Le programme doit être exécuté après le programme `record_application`, et
  avant le `update_catalog`

Les arguments sont :

* Le nom de l'application

Le programme `post_migration` est utilisé pour exécuter les scripts de
post-migration (`<APPNAME>/<APPNAME>_postmigr_<VERSION>`) d'un module lors de sa
mise-à-jour.

Tous les scripts `<APPNAME>/<APPNAME>_postmigr_<VERSION>` dont la version est
supérieure à la version de l'application précédemment enregistré sont exécutes
dans l'ordre des versions.

Exemple :

    [xml]
    <post-upgrade>
      [...]
      
      <process command="programs/pre_migration MYAPP" />
      <process command="programs/record_application MYAPP U" />
      <process command="programs/app_post MYAPP U" />
    
      <process command="programs/post_migration MYAPP" />
    
      [...]
    </post-upgrade>

Voir :

* [Scripts de pré-migration et de post-migration][#core-ref:fd259229-b279-469a-8e3c-d737fabcf9d5]

### Commande *programs/set_param* {#core-ref:39167ac3-e1e7-4d07-a784-ef9f365a6457}

Prototype :

* `programs/set_param <DYNACASE_PLATFORM_PARAM_NAME> <DYNACASE_CONTROL_MODULE_PARAM_NAME>`

Utilisable dans les phases :

* `post-install`
* `post-upgrade`

Le programme `programs/set_param` permet de positionner la valeur d'un paramètre
applicatif global d'une application Dynacase avec la valeur d'un paramètre de
module.

Exemple :

    [xml]
    <parameters>
      <param name="myapp_favorite_color" label="What is your favorite color?" type="text" default="blue" onupgrade="W"/>
    </parameters>
    
    <post-install>
      [...]
      
      <process command="programs/set_param MYAPP_GLOBAL_FAVCOLOR myapp_favorite_color" />
      
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

Voir :

* [Dynacase en ligne de commande][wsh]

### Exécution manuelle {#core-ref:e582f2b2-4342-42c0-8a54-2864985b2764}

Pour pouvoir exécuter manuellement ces programmes, il faut initialiser un
environnement d'exécution compatible comme suit :

* Le répertoire courant d'exécution doit être la racine du contexte.

* La variable d'environnement `WIFF_ROOT` doit contenir le chemin absolu d'accès
à la racine de dynacase-control.

* La variable d'environnement `WIFF_CONTEXT_ROOT` doit contenir le chemin absolu
d'accès à la racine du contexte.

* La variable d'environnement `WIFF_CONTEXT_NAME` doit contenir le nom du
contexte tel que déclaré auprès de dynacase-control.

* Si le programme est exécuté dans le cadre de la mise à jour d'un module, la
variable d'environnement `MODULE_VERSION_FROM` doit contenir la version du
module actuellement installé dans le contexte et `MODULE_VERSION_TO` doit
contenir la version du nouveau module.

* Si le programme est exécuté dans le cadre de l'installation d'un module, la
variable d'environnement `MODULE_VERSION_FROM` ne doit pas être définie et
`MODULE_VERSION_TO` doit contenir la version du module en cours d'installation.

Exemple d'initialisation d'un tel environnement en Bash :

    # /var/www/dynacase-control/wiff context foo exec /bin/bash --login
    
    $ export WIFF_ROOT=/var/www/dynacase-control
    $ export WIFF_CONTEXT_ROOT=$PWD
    $ export WIFF_CONTEXT_NAME=foo
    $ export MODULE_VERSION_FROM=1.0.0
    $ export MODULE_VERSION_TO=2.0.0

<!-- links -->
[applications_et_actions]: #core-ref:b26f57fe-4d75-4d5f-a50e-129028b379ed
[app_desc]: #core-ref:f0dbbdd0-5f93-4173-be2f-bac715b80771
[action_desc]: #core-ref:90bf0711-7874-4c9d-bdf0-7d28becb7628
[app_const]: #core-ref:8930140d-16f7-4bba-b989-c04add9c9e87
[gnu_gettext]: https://www.gnu.org/software/gettext/manual/gettext.html
[i18n]: #core-ref:8f3ad20a-4630-4e86-937b-da3fa26ba423
[webinst]: http://docs.anakeen.com/dynacase/3.2/dynacase-doc-platform-operating-manual/website/book/module.html
[wsh]: #core-ref:1566c46d-a53d-44cf-8c3f-0d0e21c0b117
[inputhelp]: #core-ref:0b2d4cd0-4eed-41d8-ac57-37525a444194
[fam_icon]: #core-ref:6f013eb8-33c7-11e2-be43-373b9514dea3
[write_an_application]: #core-ref:395f44f1-6699-4ad8-b525-31e65e9b6efb
[programs_wsh]: #core-ref:b7ad8be9-55d9-48e3-80e4-9245d6f4f345
[programs_set_param]: #core-ref:39167ac3-e1e7-4d07-a784-ef9f365a6457
[programs_post_migration]: #core-ref:6a525876-dac7-40c3-8f87-01a9bec64837
[programs_pre_migration]: #core-ref:1dbb94a3-763f-46f7-bb2d-d7029dcf8592
[programs_update_catalog]: #core-ref:a3b5b826-2476-4602-8772-4c8e264de1ed
[programs_record_application]: #core-ref:c695dfd3-dcf6-4d52-a72e-ec95cb15450e
[programs_app_post]: #core-ref:cc8bc194-900b-427a-9f5c-f4b629e81daa
[family_declaration]: #core-ref:cfc7f53b-7982-431e-a04b-7b54eddf4a75
[migrer_une_application]: #core-ref:7d037380-8fba-409b-85e5-15cbbac187bf
[mettre_a_jour_une_application]: #core-ref:15298258-e0ef-42ab-9fed-d9ac061e294c
[custom_programs]: http://docs.anakeen.com/dynacase/3.2/dynacase-doc-platform-operating-manual/website/book/module.html#manex-ref:afc3d392-bd87-418a-af0e-ceb8924e74a2
[programs_exec_env]: #core-ref:e582f2b2-4342-42c0-8a54-2864985b2764