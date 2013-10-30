# Application héritée {#core-ref:3fb1bd33-0190-4e8c-96f5-6a8c0f084e6f}

Une application peut hériter d'une application déjà installée.

**Un seul niveau d'héritage d'application est pris en compte.**

La propriété `childof` de la [description de l'application][appdesc] permet
d'indiquer l'application parente.

La partie _description_ (`$app_desc`) de l'application ne fait pas partie des
caractéristiques héritées. Cette description complète est obligatoire même en
cas d'héritage.

Lorsqu'une application héritée est installée, toutes les déclarations des
actions de l'application parente sont copiées dans l'application héritée au
moment de l'installation ou de la mise à jour de l'application héritée.

Lorsque l'application parente est mise à jour, les applications héritant sont
mise à jour également : les nouvelles actions sont ajoutées et les
éventuelles actions qui ne sont plus décrites sont supprimés des applications.
De même les actions modifiées sont aussi modifiés dans les applications
héritant de l'application parente.

## Surcharge des descriptions d'actions {#core-ref:669ec249-4b06-4dae-b9b9-f73e84b90e27}

Le fichier de description de l'application héritée peut modifier les
caractéristiques des actions de l'application parente.

Pour modifier une action parente il faut la déclarer dans le tableau
`$action_desc` en indiquant obligatoirement son nom (`name`) pour l'identifier.
Les caractéristiques des actions nécessitant d'être modifiée doivent être
indiquées. Les caractéristiques non indiquées seront celles de l'application
parente au moment de l'installation ou de la mise à jour.

Extrait de l'application parente :

    [php]
    $action_desc = array(
        array(
            "name"       => "ONEFAM_ROOT",
            "short_name" => N_("one family root"),
            "acl"        => "ONEFAM_READ",
            "root"       => "Y"
        )
    );

Extrait de l'application héritée :

    [php]
    $action_desc = array (
        array(
           "name"       =>"ONEFAM_ROOT",
           "root"       => "N"
        )
    );

Dans cet exemple, l'action `ONEFAM_ROOT` a les caractéristiques suivantes
provenant de l'application héritée :

*    name          : "ONEFAM_ROOT",
*    short_name    : N_("one family root"),
*    acl           : "ONEFAM_READ",
*    root          : "**N**"
*    script        : "onefam_root.php"
*    function      : "onefam_root"
*    layout        : "onefam_root.xml"


L'action `ONEFAM_ROOT` n'est plus l'action principale dans ce cas.

### Surcharge du contrôleur de l'action {#core-ref:68b42cdf-6983-455e-a8fd-03fceda299f5}
Le contrôleur de l'action peut être changé en modifiant la description.

Extrait de l'application parente `MY_FIRSTAPP`:

    [php]
    $action_desc = array(
        array(
            "name"       => "MY_FIRSTACTION",
            "short_name" => N_("my action"),
            "acl"        => "MY_ACL"
        )
    );

Extrait de l'application héritée `MY_SPEAPP`:

    [php]
    $action_desc = array (
        array(
           "name"       =>"MY_FIRSTACTION",
           "function"   => "spe_firstaction"
           "script"     => "spe_firstaction.php"
        )
    );

Dans cet exemple, l'action `MY_FIRSTACTION` a les caractéristiques suivantes
dans l'application héritée :

*    name          : "MY_FIRSTACTION",
*    short_name    :  N_("my action"),
*    acl           : "MY_ACL",
*    root          : "N
*    script        : "**spe_firstaction.php**"
*    function      : "**spe_firstaction**"
*    layout        : "my_firstaction.xml"

Le fichier `spe_firstaction.php` proviendra du répertoire `MY_SPEAPP`, le
fichier `my_firstaction.xml` proviendra du répertoire `MY_FIRSTAPP/Layout`.

**Note** : la fonction surchargée peut appeler la fonction parente si les noms
  des fonctions sont différents.

    spe_firstaction.php

    [php]
    require_once "MYAPP/my_firstaction.php";
    
    function spe_firstaction(Action $action) {
        my_firstaction($action); // call parent action
        // ... do specific custom
    }

### Surcharge du template de l'action {#core-ref:aff349cc-cca5-4db8-94cf-e3ed857b709f}

Le template de l'action peut être changé en modifiant la description.

Extrait de l'application parente `MY_FIRSTAPP`:

    [php]
    $action_desc = array(
        array(
            "name"       => "MY_FIRSTACTION",
            "short_name" => N_("my action"),
            "acl"        => "MY_ACL"
        )
    );

Extrait de l'application héritée `MY_SPEAPP`:

    [php]
    $action_desc = array (
        array(
            "name"       =>"MY_FIRSTACTION",
            "layout"   => "spe_firstaction.xml"
        )
    );

Dans cet exemple, l'action `MY_FIRSTACTION` a les caractéristiques suivantes
dans l'application héritée :

*   name          : "MY_FIRSTACTION",
*   short_name    :  N_("my action"),
*   acl           : "MY_ACL",
*   root          : "N
*   script        : "my_firstaction.php"
*   function      : "my_firstaction"
*   layout        : "**spe_firstaction.xml**"

Le fichier `my_firstaction.php` provient du répertoire `MY_FIRSTAPP`, le
fichier `spe_firstaction.xml` provient du répertoire `MY_SPEAPP/Layout`.

## Surcharge par publication {#core-ref:a52907ca-b5af-40f9-a2f3-aa945849a72b}

Les contrôleurs et les template peuvent aussi être surchargés si l'application
dérivée contient un fichier PHP contrôleur de même nom que l'application
parente ou si elle contient un template de même nom.

Le contrôleur est d'abord recherché dans le répertoire de l'application dérivée
et ensuite dans le répertoire de l'application parente. De même, le template est
d'abord recherché dans le répertoire `Layout` de l'application dérivée et
ensuite dans le répertoire `Layout` de l'application parente.

## Ajouter de nouvelles actions {#core-ref:727601e3-1306-4032-8015-1b1fa5228a3d}

La description des nouvelles [actions][actiondef] est insérée dans le tableau
`$action_desc` comme pour la modification des actions hérités.

Ces actions peuvent utiliser les droits déclarés sur l'application parente.

## Héritage des droits {#core-ref:56f74404-98d8-4d85-b9f9-40d7211bb822}

Les déclarations des [droits][acldef] inscrits dans le tableau `$app_acl` sont
copiés dans l'application héritée.

Au niveau de la pose des droits aux utilisateurs, groupes et rôles aucun
héritage n'est effectué. Les droits d'une application parente et d'une
application héritée sont totalement dissociés. Seuls les noms et description
des droits sont réutilisés.

De nouveaux droits peuvent être indiqués dans le tableau `$app_acl`. Lors de
l'installation ou de la mise à jour, ces nouveaux droits sont ajoutés aux
droits hérités. Il n'est pas possible d'enlever des descriptions de droits
fournies par l'application parente.

## Modification des paramètres applicatifs {#core-ref:6eb341da-29df-4145-b8de-27ba62571c15}

Pour les [paramètres de l'application][paramdef] parente seuls les paramètres
non globaux pourront être redéfinis par les applications filles. Les valeurs
des paramètres globaux sont communs à l'ensemble des applications dérivées.

Paramètres de l'application parente :

    [php]
    $app_const = array(
        "VERSION" => "3.2.7-0",
        "ONEFAM_IDS" => array(
            "val" => "",
            "global" => "N",
            "user" => "Y",
            "kind" => "static",
            "descr" => N_("visible user families")
        ) ,
        "ONEFAM_MIDS" => array(
            "val" => "",
            "global" => "N",
            "user" => "N",
            "descr" => N_("visible master families")
        ) ,
        "ONEFAM_GLOBALMAX" => array(
            "val" => "",
            "global" => "Y",
            "user" => "N",
            "descr" => N_("Seuil maximum")
        )
    );

Modification des paramètres sur l'application héritée

    [php]
    $app_const = array(
        "VERSION" => "1.0.1-0",
        "ONEFAM_IDS" => "MY_FAMILYONE,MY_FAMILYTWO",
        "ONEFAM_MIDS" => "MY_FAMILYTHREE"
    );
   
Dans cet exemple les paramètres "ONEFAM_IDS" et "ONEFAM_MIDS" peuvent être
initialisés avec leur propre valeur. Le paramètre "ONEFAM_GLOBALMAX" lui ne peut
faire l'objet d'une modification.

L'application héritée peut ajouter ces propres paramètres dans le tableau
`$app_const`.

## Créer une application pouvant être dérivée {#core-ref:ab8374b9-684d-4cdf-bb4d-265b4f87b375}

Si une application n'a pas été prévue pour être dérivée alors il n'est pas
possible à l'application hérité de modifier le comportement des actions et des
interfaces. Seuls des ajouts d'actions seront possibles.

Pour réaliser une application dérivable, il faut utiliser le paramètre
applicatif `APPNAME` pour construire l'ensemble des identifiants de zones et
d'actions. Ce paramètre applicatif contient le nom de l'application courante.

Exemple :

    [html]
    <h1>Application [APPNAME]</h1>
    <a href="?app=[APPNAME]&amp;action=MY_ACTION">Entrez dans l'action</a>
    
    [ZONE [APPNAME]:MY_ZONE]

Le template ci-dessus, est différent en fonction des différentes applications
dérivées. Si une application dérivée modifie le comportement de l'action
`MY_ACTION` alors dans ce cas l'url de l'ancre pointera sur l'action modifiée
et non sur l'originale. De même avec l'action `MY_ZONE` qui est l'action
modifiée en cas de dérivation.

<!-- links -->
[appdesc]: #core-ref:f0dbbdd0-5f93-4173-be2f-bac715b80771
[paramdef]: #core-ref:c3d9cb18-16d0-435a-b8c2-5fa6ac06c522
[acldef]: #core-ref:a98b72ea-c063-4907-abc4-e5171ab55e59
[actiondef]: #core-ref:e67d8aeb-939c-46e3-9be8-6fc3ba75ebc2
