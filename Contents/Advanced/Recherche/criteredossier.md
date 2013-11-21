# Recherche de document contenu dans une collection {#core-ref:7f084be4-ceb8-464d-81e4-8902da361aff}

La classe `SearchDoc` permet de faire des recherches dans une collection
spécifique (dossier ou recherche) au moyen de la méthode
[`SearchDoc::useCollection()`][useCollection].

Cette recherche n'est pas récursive par défaut, c'est à dire qu'elle ne
recherche que dans la collection indiquée.

Lorsque la collection est un dossier, il est possible de faire des recherches
récursives à l'aide de la méthode `DocSearch::setRecursiveSearch()`. Le niveau
de profondeur de la recherche est ensuite défini au moyen de la propriété
`DocSearch::folderRecursiveLevel`, positionné à 2 par défaut.

**Note** : Le `setRecursiveSearch` fait référence au niveau de récursivité. par
exemple, `folderRecursiveLevel=0` veut dire que l'on recherche dans le dossier,
alors que `folderRecursiveLevel=1` indique de rechercher dans le dossier et ses
sous-dossiers.

Lorsque la collection est une recherche, il n'est pas possible de faire la
recherche récursivement.

    [php]
    $dirid=2345; // identifiant d'un document recherche
    $searchDoc = new SearchDoc();
    $searchDoc->setObjectReturn();
    $searchDoc->useCollection($dirid);
    $searchDoc->search();
    if ($searchDoc->searchError()) {
        $action->exitError(sprintf("search error : %s",$searchDoc->getError()));
    }

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
[useCollection]:        #core-ref:881c9fcb-81c2-45af-b89f-70be3a7f24b7