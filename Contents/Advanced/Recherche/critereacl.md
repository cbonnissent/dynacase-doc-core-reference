# Recherche en fonction des droits {#core-ref:8fd719e9-cc92-4ca4-822c-911a9fee10bf}

## Recherche sans droit {#core-ref:f3fb1d45-d401-4ffd-a152-0fe0aa005a81}

Par défaut, seuls les documents que l'utilisateur a le droit de voir sont
retournés. Pour retourner tous les documents sans vérifier les droit, il faut
utiliser la méthode `overrideViewControl()`.

    [php]
    $s=new SearchDoc(getDbAccess(), $familyId);
    $s->overrideViewControl(); // pas de control de droit voir

**Note** : Si la recherche est faite sous l'identité `admin`, aucun droit n'est
vérifié.

## Recherche et documents confidentiels {#core-ref:5da495b6-7e9f-4063-a254-3689bb786389}

Les documents confidentiels sont les documents dont la propriété 'confidential'
est égale à 1. L'accès à ces documents doit être contrôlé par l'application qui
décide quelles parties elle veut montrer. À la différence du droit voir ('view')
des documents, la recherche retourne les documents confidentiels par défaut. Le
filtrage est à faire du côté de l'application avec un post-traitement.
Cependant, il est possible de rajouter un filtre permettant de ne pas retourner
les documents confidentiels que l'utilisateur n'a pas le droit de voir (droit :
'confidential'). Pour cela, il faut appeler la méthode "excludeConfidential()".

    [php]
    $sd=new SearchDoc($dbaccess, $familyId); 
    $sd->excludeConfidential(); 
    $sd->search();
    

<!-- link -->
[searchdoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[propdoc]:          #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Liste des propriétés du document"
[layoutblock]:      #core-ref:587b563e-7371-469f-9d1e-350607056c73
[formatcollection]: #core-ref:74ce9ce4-8e4e-42ee-a0df-415eb6897a81
[pgop]:             http://www.postgresql.org/docs/9.1/static/functions.html "Opérateurs Postgresql 9.1"
[docattributs]:     #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3
[attdocid]:         #core-ref:d461d5f5-b635-47a0-944d-473c227587ab
[phpiterator]:      http://php.net/manual/fr/class.iterator.php "Interface Iterator"
[docacl]:           #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d "Droits du document"