# Transactions et savePoint  {#core-ref:32e0a8cb-0e8b-4f77-a62d-a45da16d39a8}

Des transactions et des points de sauvegarde de base de donnés peuvent être
utilisés afin de confirmer ou de revenir à un point de sauvegarde. Ces
transactions n'ont aucun effet sur l'objet mémoire manipulé.

Les méthodes `DbObj::savePoint()`, `DbObj::rollbackPoint()` et
`DbObj::commitPoint()` permettent de gérer les transactions et les points de
retours.

    [php]
    include_once("FDL/Class.Doc.php");
    $d=new_doc("",8160); // Doc dérive de DbObj
    $d->savePoint("One");
    $d->setValue("us_lname","Test one");
    $d->store();  // modification en base doc n°8160 à comme nom "Test One"
    
    $d->savePoint("Two");
    $d->setValue("us_lname","Test two");
    $d->store();// modification en base doc n°8160 à comme nom "Test Two"
    $d->rollbackPoint("Two"); // annulation de toutes les requêtes depuis le point "Two"
    
    $d->commitPoint("One"); // acquittement des requêtes depuis le point "One"
    // le document en BD a maintenant comme nom "Test One"
    // ATTENTION : le document conserve en mémoire sa dernière valeur "Test two".

Les points de sauvegarde ne sont pas liés à un objet mais impactent toutes les
requêtes liées à la base.

Si vous avez déclaré un savePoint il faut obligatoirement avoir un commitPoint
ou un rollbackPoint de ce point. Dans le cas contraire toutes les modifications
sur la base de données, depuis le premier point de sauvegarde, seront
abandonnées. Les méthodes de point de sauvegarde sont accessibles depuis tout
objet dbObj, pas seulement Doc.

Néanmoins, il n'est pas obligatoire d'appliquer un commit ou un rollback sur tous
les points, mais il est obligatoire de le faire au moins sur le premier.

    [php]
    $d->savePoint("One");
    $d->setValue("us_lname","Test one");
    $d->store();
    
    $d->savePoint("Two");
    $d->setValue("us_lname","Test two");
    $d->store();
    
    $d->savePoint("Three");
    $d->setValue("us_lname","Test three");
    $d->store();
    $d->rollbackPoint("Two"); // on retourne au point Two, le point Three est effacé
    
    $d->commitPoint("One"); 

le document a maintenant comme nom "Test One" 