# Traitement des erreurs {#core-ref:0aa58477-0cb6-4da6-9e34-fae048d10bd6}

Si la requête échoue suite à des erreurs de filtres une exception de type `\Dcp\Db\Exception` est retournée.

Les autres erreurs de configuration sont accessibles en utilisant la méthode
::getError().

    [php]
    try {
        $s=new SearchDoc(getDbAccess(), \Dcp\Family\Iuser::familyName);
        $s->addFilter('us_extmail is not null');
        $s->addFilter("pas bon"); // ici une erreur de filtre
        $results=$s->search();
        if ($s->getError()) {
            // autre erreur de configuration
           printf("search error : %s",$s->getError());
        }
    } catch (\Dcp\Db\Exception $e) {
        print($e->getMessage());
    }

Résultat :

    {DB0005} query prepare error : ERROR:  syntax error at or near "bon"
    LINE 1: ...cked != -1) and (us_extmail is not null) and (pas bon) ORDER...

La classe SearchDoc permet de récupérer les informations sur la requête afin de
débugguer votre recherche. Ces informations sont consultables avec la méthode
DocSearch::getSearchInfo() après avoir exécuté la recherche.:

    [php]
    $s=new SearchDoc("","IUSER");
    $s->addFilter('us_extmail is not null');
    $s->search();
    print_r($s->getSearchInfo())

Résultat :

    Array
    (
        [count] => 4
        [query] => select doc128.id, owner, title, ... us_accexpiredate, values, attrids  from  doc128  where   (doc128.archiveid is null) and (doc128.doctype != 'T') and (doc128.locked != -1) and (us_extmail is not null) ORDER BY title LIMIT ALL OFFSET 0;
        [error] => 
        [delay] => 0.008s
    )


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