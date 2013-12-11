# Compter le nombre de résultats {#core-ref:0afc5f26-837a-4ffc-96c8-6b5c2131246a}

Le nombre de résultats peut être obtenu avec la méthode
[`DocSearch::count()`][count] après avoir effectué la recherche (appel
[`DocSearch::search()`][docsearch]).

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    $s->search();
    $c=$s->count(); // retourne le nombre de résultat

Si seul le nombre vous intéresse, la méthode [`DocSearch::count()`][count] n'est
pas la plus performante car la requête est lancée et l'ensemble des résultats
est récupéré. Pour des performances accrues, il faut utiliser la méthode
[`SearchDoc::onlyCount()`][onlycount]. Ceci effectue la recherche en ne
retournant que le nombre de documents correspondants.

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    // pas d'appel à Doc::Search
    $c=$s->onlyCount();// retourne le nombre de résultat

Attention, le premier appel à une des méthodes
[`DocSearch::search()`][docsearch] ou [`SearchDoc::onlyCount()`][onlycount]
lance une requête au serveur de base de données. Le résultat est mis en cache
pour être exploité par les itérateurs.

    [php]
    $s = new SearchDoc('', 'ANIMAL');
    $s->addGeneralFilter("cheval noir");
    $s->setObjectReturn();
    // pas d'appel à Doc::Search
    $c=$s->onlyCount();// retourne le nombre de résultat
    
    $s->addFilter("cdate > '%s'", date("Y-m-d")); // ajoute un critère
    $s->search(); // relance le recherche


<!-- link -->
[count]:            #core-ref:8daca9d1-69e9-4871-b661-d710b8727d41
[onlycount]:        #core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa
[docsearch]:        #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[searchdoc]:        #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[propdoc]:          #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Liste des propriétés du document"
[layoutblock]:      #core-ref:587b563e-7371-469f-9d1e-350607056c73
[formatcollection]: #core-ref:74ce9ce4-8e4e-42ee-a0df-415eb6897a81
[pgop]:             http://www.postgresql.org/docs/9.1/static/functions.html "Opérateurs Postgresql 9.1"
[docattributs]:     #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3
[attdocid]:         #core-ref:d461d5f5-b635-47a0-944d-473c227587ab
[phpiterator]:      http://php.net/manual/fr/class.iterator.php "Interface Iterator"
[docacl]:           #core-ref:a99dcc5f-f42f-4574-bbfa-d7bb0573c95d "Droits du document"