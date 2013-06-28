# Les droits applicatifs {#core-ref:a98b72ea-c063-4907-abc4-e5171ab55e59}

Une application définit un ensemble de droits applicatifs. ils sont définis dans
le fichier `MYAPP.app`.

Chaque action peut être soumise à un droit applicatif (ACL).
Ces droits permettent de gérer l'accès à ces actions : seuls les utilisateurs
possédant cette ACL peuvent exécuter cette action.

Exemple de `MYAPP.app` avec les droits applicatifs :
Pour la définition de `$app_desc` se reporter au chapitre
[applications][my_app.app]

    [php]
    <?php
    $app_desc = array(...);
    
    $app_acl = array(
        array(
            "name"          => "NORMAL",
            "description"   => N_("Access to common action"),
            "group_default" => "Y"
        ),
        array(
            "name"          => "EDIT",
            "description"   => N_("Access to edit action"),
            "group_default" => "Y"
        ),
        array(
            "name"          => "EXPORT",
            "description"   => N_("For export functions"),
            "group_default" => "N"
        )
    );

Chaque ACL doit se trouver dans un tableau. Ce tableau peut contenir les clés :

**name** (obligatoire)
:   Nom logique de l'ACL.
    
    Il sera utilisé pour référencer l'ACL (dans la
    [description des actions][action_desc] par exemple).

**description** (facultatif)
:   Description de l'ACL. (non multiligne).

**group_default** (facultatif)
:   Indique si l'ACL est affectée au groupe *Utilisateurs* (*GDEFAULT*).
    Peut prendre deux valeurs:
    
    * `Y` : l'ACL est affectée au groupe *Utilisateurs*
    * `N` : l'ACL n'est affectée à aucun groupe (valeur par défaut)

Plus d'informations sur le fonctionnement des Acls sont disponibles dans le
chapitre sur [le fonctionnement de la sécurité dans Dynacase][securite].

<!-- links -->
[my_app.app]: #core-ref:cf584c21-ebee-4444-8046-da3fa3a2db1b
[action_desc]: #core-ref:90bf0711-7874-4c9d-bdf0-7d28becb7628
[securite]: #core-ref:4e298112-3c56-4677-a05f-e314b1406326