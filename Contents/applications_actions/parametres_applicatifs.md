# Les paramètres applicatifs {#core-ref:c3d9cb18-16d0-435a-b8c2-5fa6ac06c522}

Une application peut requérir différentes variables pour fonctionner.
Ces variables devront être inscrites en paramètre dans le fichier
`MYAPP_init.php`.

Elles seront ensuite modifiables par l'administrateur via le
*centre d'administration*.

## Déclaration des paramètres {#core-ref:8930140d-16f7-4bba-b989-c04add9c9e87}

Pour déclarer des paramètres, il faut ajouter un tableau `$app_const` dans le
code du fichier `MYAPP_init.php` :

    [php]
    <?php
    global $app_const;
    $app_const = array(
        "VERSION" => "1.0.3-1", // Paramètre minimum obligatoire
        "Name_of_the_parameter" => array(
           "val" => "1",
           "descr" => N_("Description of the parameter"),
           "global" => "Y",
           "user" => "N"
        )
    );
    ?>

Les index du tableau `$app_const` définissent les identifiants des paramètres.
Le tableau définissant le nouveau paramètre peut contenir les mots-clés
suivants :

**val** (obligatoire)
:   Indique la valeur par défaut du paramètre.
    
    Cette valeur peut par la suite être modifiée par l'administrateur dans le
    _centre d'administration_
    (Menu "Gestion des applications"/"Paramètres applicatifs").

**descr** (facultatif)
:   Permet de noter une description qui sera affichée au même endroit que la
    valeur.
    
    Cette valeur fait l'objet d'une traduction dans les interfaces du 
    _centre d'administration_.

**global** (facultatif)
:   Indique si le paramètre est global.
    
    Ce mot-clé peut prendre deux valeurs :
    
    *   `Y` : indique que le paramètre est global.
    *   `N` : indique que le paramètre n'est pas global (valeur par défaut).
    
    Un paramètre global est accessible depuis toutes applications.
    Dans ce cas, il sera affiché en gras dans le menu "Paramètres applicatifs"
    du _centre d'administration_. Dans le cas contraire, le paramètre sera 
    accessible uniquement par l'application qui le déclare et les applications
    qui en sont hérités.

**user** (facultatif)
:   Indique si la valeur du paramètre est personnalisable pour chaque
    utilisateur ayant accès à l'application. Il peut prendre deux valeurs :
    
    *   `Y` : indique que le paramètre pourra être personnalisable pour chaque
        utilisateur. Dans ce cas, le paramètre apparaîtra aussi dans le menu du
        *Paramètres utilisateurs* du _centre d'administration_.
    *   `N` : indique que le paramètre ne pourra pas être personnalisable par
        utilisateur (valeur par défaut).

**kind** (facultatif)
:   Le type du paramètre. Les valeurs acceptées sont :
    
    **`text`**
    :   Indique que le paramètre sera une chaîne de caractère.
        C'est la valeur par défaut.
    
    **`enum`**
    :   Indique que le paramètre sera un énuméré.
        
        Dans ce cas il faut préciser les valeurs possibles de l'énuméré dans la
        déclaration du **kind**. Exemple: `enum(yes|no)`
    
    **`color`**
    :   Indique que le paramètre sera une couleur.
        
        Dans ce cas, un color picker sera proposé lors du changement de valeur
        du paramètre dans le _centre d'administration_.
    
    **`password`**
    :   Indique que le paramètre sera de type "mot de passe".
        
        Dans ce cas, la valeur ne sera pas affichée, elle sera remplacée par
        "*****" pour montrer qu'il y a un mot de passe mais stockée en clair.
    
    **`static`**
    :   Indique que la valeur est non modifiable dans le
        _centre d'administration_. Dans ce cas, le paramètre ne sera affiché que
        lors du clic sur le bouton "Afficher les paramètres non modifiables",
        et il sera affiché en gris.
        
        Lors d'une mise à jour de l'application sa valeur est modifiée.
    
    **`readonly`**
    :   Comme pour `static` indique que la valeur est non modifiable dans le
        _centre d'administration_. A la différence de `static`, lors d'une
        mise à jour de l'application sa valeur n'est pas modifiée.

Le paramètre `VERSION` est un paramètre obligatoire qui doit contenir la version
de l'application sous la forme suivante : `X.Y.Z-R` où X.Y.Z définissent la
version et R la release. X,Y et Z sont des nombres entiers.
Exemple de version : "3.5.12-4". Ce paramètre est utilisé pour les
[migrations][migration_scripts].

Pour les paramètres hérités seule la valeur doit être mise à l'index
correspondant dans le tableau, il ne faut pas, dans ce cas, mettre le tableau de
définition du paramètre.

## Règles : {#core-ref:041b373b-a539-423c-b56e-dbbe60e0b8b6}
*   Une valeur d'un paramètre global ne peut pas être redéfinie dans une
    application fille ni dans aucune autre application.
*   Le nom d'un paramètre global doit être unique pour l'ensemble des
    applications installées. Sinon aucune erreur ne sera levé et la valeur
    retournée n'est pas garantie.
*   Seule la valeur d'un paramètre applicatif (non global) peut être redéfinie
    dans une application fille. Les caractéristiques d'un paramètre ne peuvent
    pas être redéfinies.
*   Lors des mises à jour d'application, les valeurs des paramètres ne sont
    pas modifiées sauf pour le type `static`.

## Forcer la mise à jour des paramètres {core-ref:4bd9e0d5-dfaf-41e8-acbf-92f8d6bbcd44}

Les paramètres d'une application peuvent être mis à jour de manière explicite
par la commande `manageApplications` via le programme `wsh`.

    www-data@test:~$ ./wsh.php --api=manageApplications --help
    
    Manage application
    Usage :
        --appname=<application name>
        Options:
        --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
        --method=<action to do> [init|update|reinit|delete], default is 'init'
        --help (Show usage) 

Exemple :

    www-data@test:~$ ./wsh.php --api=manageApplications --appname=MYAPP --method=update
    MYAPP...update
    15/05/2013 13:31:56 LOG::[I] Dynacase:DbObj:application  : Init : MYAPP
    15/05/2013 13:31:56 LOG::[I] Dynacase:DbObj:acl  : Acl Modify : MYAPP_VERIFICATION, Access to ticket sales
    15/05/2013 13:31:56 LOG::[I] Dynacase:DbObj:action  : Update Action MYAPP_ACTION1
    15/05/2013 13:31:56 LOG::[I] Dynacase:DbObj:action  : Update Action MYAPP_ACTION2


Si la commande est :

`init` 
:   ajoute les paramètres à l'application à initialiser
    (ne pas utiliser si application déjà initialisée).

`update` 
:   modifie les paramètres / ajoute les nouveaux paramètres.

`reinit`
:   force mise à jour des valeurs des paramètres telles quelles sont décrites
    dans le fichier `MYAPP_init.php`.

`delete`
:   supprime les paramètres de l'application ainsi que l'application elle-même.

<!-- links -->
[migration_scripts]: #core-ref:4ccad856-cc9e-471a-9669-d3d4cc65059f