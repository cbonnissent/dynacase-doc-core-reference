# Recherche de documents {#core-ref:7291dea8-a2db-46be-8194-bc6f100cc467}


## Recherche de documents issus d'une même famille  {#core-ref:5954b300-a514-4a3e-966e-dac5cf07950d}

La recherche de document en fonction d'une famille est réalisé avec la classe
[`SearchDoc`][searchdoc].

Cette classe apporte tous les mécanismes permettant de rechercher de façon
efficace des documents.

Exemple basique : recherche de tous les utilisateurs (document de la famille
`IUSER`)

    [php]
    $s=new SearchDoc(getDbAccess(), \Dcp\Family\Iuser::familyName);
    $results=$s->search();
    print_r($results);

Le retour par défaut est sous la forme de tableau indexé par les noms des
[propriétés][propdoc] et des [attributs][docattributs] du document.

Exemple de retour :

    [php]
    Array
    (
        [0] => Array
            (
                [id] => 1009
                [owner] => 1
                [title] => anonymous guest
                ....les attributs de la famille IUSER
                [us_lname] => anonymous
                [us_fname] => guest
                [us_mail] => 
                [us_extmail] => 
                [us_meid] => 1009
                [us_login] => anonymous
                ...
                )
        [1] => Array
            (
                [id] => 5835
                [owner] => 1
                [title] => Dogue Robert
                ...

L'utilisation de ce type de retour peut être utilisé avec les
[templates][layoutblock]. Dans le cadre d'une recherche de document pour
réaliser un retour sur une interface, la classe
[`formatCollection`][formatcollection] permet de récupérer de manière optimisée
les données affichables des documents recherchés.

## Récupération du résultat de la recherche {#core-ref:d0a89548-a743-4dfc-bf43-49192ef1b6a8}

Par défaut les résultats suivants sont exclus :

*   Les documents supprimés (`doctype = 'Z'`)
*   Les documents figés (`locked = -1`)
*   Les documents temporaires (`doctype='T'`)
*   Les documents archivés (`archiveid is null`)
*   Les documents non visibles par l'utilisateur courant ([droit][docacl] `view`)


### Retour de documents bruts  {#core-ref:4c508940-f5a0-40ee-a942-6372a95d112e}

Si la méthode ::setObjectReturn() n'est pas utilisée ou utilisée avec l'argument
`false` la méthode `SearchDoc::search()` retourne un tableau à 2 dimensions. Le
tableau de deuxième niveau contient les valeurs brutes des propriétés et des
attributs du document indexé par leur nom.

Avec une boucle `foreach`.

    [php]
    $s=new SearchDoc("","IUSER");
    $rawDocuments=$s->search();
    foreach ($rawDocuments as $k=>$rawDoc) {
      print "$k)".$rawDoc["title"]."(".getv($rawDoc,"us_mail","nomail").")\n";
     }

Avec une boucle `while` en utilisant la méthode `SearchDoc::nextDoc()` : 

    [php]
    $s=new SearchDoc("","IUSER");
    $s->search();
    $k=0;
    while ($rawDoc=$s->nextDoc()) { 
      print "$k)".$rawDoc["title"]."(".getv($rawDoc,"us_mail","nomail").")\n";
      $k++;  
    }

**Note** : La fonction `getv` retourne la valeur d'un élément du document brut.
Cette fonction permet aussi d'extraire des valeurs pour des attributs
spécifiques aux sous-familles si la recherche comporte de tels documents.

### Retour d'objets documentaires {#core-ref:84a293c0-0ea6-428c-8da6-f8cc46980d5b}

Ce programme permet d'écrire tous les titres des documents accisible de la
famille "utilisateur". Ici, on n'a utilisé que le critère d'appartenance à
une famille.  L'appel à la méthode DocSearch::setObjectReturn() indique que le
retour de méthode DocSearch::Search() est un tableau d'objets documentaires.

Dans ce cas, il est possible d'appliquer les méthodes des objets sur les retours
(exemple Doc::getRawValue).  

    [php]
    $s=new SearchDoc('',"IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); 
    $s->search(); // déclenchement de la recherche
    
    $c=$s->count();
    print "count $c\n";
    $k=0;
    while ($doc=$s->nextDoc()) {
      print "$k)".$doc->getTitle()."(".$doc->getRawValue("US_MAIL","nomail").")\n";
      $k++; 
    }

**Note** : Le document retourné dans la variable `$doc` ne doit pas être utilisé
en dehors de la boucle. Cette variable est réutilisée à chaque itération.

### Utilisation des itérateurs {#core-ref:2097dfea-e13b-4fb3-be10-f346c2171228}

Pour récupérer la liste des documents, il est aussi possible d'utiliser un
[itérateur PHP][phpiterator] afin de parcourir la liste des documents.

    [php]
    $s=new SearchDoc("","IUSER");
    $s->setObjectReturn(); // retour d'objets documentaires
    $s->addFilter('us_extmail is not null'); // retour d'objets documentaires
    $s->search(); // déclenchement de la recherche
    $dl=$s->getDocumentList();
    
    foreach ($dl as $docid=>$doc) {
      print "$docid)".$doc->getTitle()."(".$doc->getRawValue("us_mail","nomail").")\n";
    }
 
La méthode ::getDocumentList() retourne un objet `DocumentList` qui est un
itérateur. Il est possible avec cet objet de l'utiliser dans une boucle
classique "foreach". 

**Attention** : ne pas utiliser directement la méthode getDocumentList dans le
foreach car cela retournerait un nouvel itérateur à chaque boucle.

**Note** : Le document retourné dans la variable `$doc` ne doit pas être utilisé
en dehors de la boucle. Cette variable est réutilisée à chaque itération.



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