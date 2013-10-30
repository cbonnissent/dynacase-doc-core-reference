# Callback et itérateur {#core-ref:c7cc0501-bec4-4948-af31-0ed217ff84ae}

## Callback sur un itérateur {#core-ref:8d29c759-c339-437f-8391-7acdaa26a9a3}

Il est possible d'appliquer une fonction sur chacun des documents d'une liste de
documents provenant d'un itérateur.

    [php]
    $s=new SearchDoc("","IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); 
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();
    $test=1;
    $callback=function (&$doc) use ($test) {
        if ($test) { // test for fun
            $doc->lock();  // lock document
        }
    };
    $dl->listMap($callback);
    foreach ($dl as $docid=>$doc) {
        print "$docid)".$doc->getTitle()."(".$doc->getProperty("locked").")\n";
    }

Dans cet exemple l'ensemble des documents sera verrouillé.  *Attention* : La
fonction de mapping est appelée sur chacun des documents lors de l'itération.
S'il n'y a pas d'itération la fonction de mapping ne sera pas appelée.

## Callback sur un itérateur avec filtrage {#core-ref:13b548b0-0e13-407c-b7f3-0d32321d5602}

La fonction de callback permet aussi d'exclure des documents de l'itérateur. Si
la méthode retourne le booléen `false` alors le document sera exclu de la liste.
Tout autre retour que le booléen `false`, retournera le document, même s'il n'y
a pas de retour explicite.

    [php]
    $s=new SearchDoc("","MY_DOCS");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();
    
    $callback=function (&$doc) {
        if (! $doc->isLocked()) {
            $doc->lock();
            return true;
        }
        return false;
    };
    $dl->listMap($callback);
    foreach ($dl as $docid=>$doc) {
        print "$docid)".$doc->getTitle()."(".$doc->getProperty("locked").")\n";
    }

Cet exemple ne verrouillera que les document non verrouillés et ne retournera
que les documents venant d'être verrouillés.


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