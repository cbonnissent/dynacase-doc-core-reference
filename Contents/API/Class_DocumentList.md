# Classe DocumentList {#core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3}

La classe `DocumentList` représente une abstraction permettant de manipuler une
liste de documents. Cette classe implémente les interfaces :

* [`Iterator`][php_iterator],
* [`Countable`][php_countable].

Les objets de cette classe peuvent donc être utilisés via la directive 
[`foreach()`][php_foreach] et être utilisés par la fonction [`count()`][php_count].

Dans le cas d'une itération avec [`foreach()`][php_foreach], les clefs sont
alors les identifiants des documents et les valeurs sont les documents sous la
forme d'un objet [`Doc`][Doc] ou de [documents bruts][resultatBrut].

Il existe plusieurs moyens d'obtenir un objet `DocumentList`, par exemple à partir:

* d'un array d'identifiant de documents,
* d'un objet [`SearchDoc`][SearchDoc],
* de la méthode [`SearchDoc::getDocumentList`][SearchDoc::getDocumentList].


## Constructeur {#core-ref:176382e7-c09e-4c5c-a9bd-7a4490b169c3}

L'objet `DocumentList` peut être construit à priori à partir d'un objet
[`SearchDoc`][SearchDoc] de recherche de documents.

    [php]
    $search = new \SearchDoc(...);
    $documentList = new \DocumentList($search);

L'objet `DocumentList` peut aussi être initialisé à posteriori à l'aide de la
méthode [`addDocumentIdentifiers`][DocumentList::addDocumentIdentifiers] pour la
recherche des dernières révisions de documents :

    [php]
    $documentList = new \DocumentList();
    $documentList->addDocumentIdentifiers(array($initId_1, [...], $initId_N));

## Exemples {#core-ref:a51a0cd0-a4a3-4dfb-a0f1-20f88043e87a}

- Exemple #1

`DocumentList` avec des [documents bruts][resultatBrut] :

    [php]
    $search = new SearchDoc('', 'FACTURE');
    $search->addFilter("montant >= %d", 10000);
    
    /*
     * Par défaut, `searchDoc` retourne des documents bruts.
     *
     * La liste `DocumentList` obtenue contient alors des
     * documents bruts.
     */
    
    $documentList = new \DocumentList($search);
    
    /*
     * On parcours la liste des résultats avec un foreach()
     */
    
    printf("Nombre de factures : %d", count($documentList));
    
    foreach ($documentList as $docId => $rawDoc) {
        printf("* Facture {id = '%d', title = '%s'}.", $docId, $rawDoc['title'])
    }

- Exemple #2

`DocumentList` avec des objets `Doc` :

    [php]
    $search = new SearchDoc('', 'FACTURE');
    $search->addFilter("montant >= %d", 10000);
    
    /*
     * On configure la recherche pour retourner des objets `Doc`
     */
    
    $search->setObjectReturn(true);
    
    /*
     * La liste `DocumentList` obtenue contient alors des objets `Doc`.
     */
    $documentList = new \DocumentList($search);
    
    /*
     * On parcours la liste des résultats avec un foreach()
     */
    
    printf("Nombre de factures : %d", count($documentList));
    
    foreach ($documentList as $docId => $doc) {
        printf("* Facture {id = '%d', title = '%s'}.", $docId, $doc->getTitle());
    }

## Voir aussi {#core-ref:200a0283-e26b-4889-8034-22f426a7ae5f}

- [`DocumentList::addDocumentIdentifiers`][DocumentList::addDocumentIdentifiers]
- [`SearchDoc`][SearchDoc]

<!-- links -->
[php_iterator]: http://docs.php.net/manual/fr/class.iterator.php
[php_countable]: http://docs.php.net/manual/fr/class.countable.php
[php_foreach]: http://docs.php.net/manual/fr/control-structures.foreach.php
[php_count]: http://docs.php.net/manual/fr/function.count.php
[SearchDoc::getDocumentList]: #core-ref:8f0824fa-eed6-4170-b52d-d3dc7c5cb9c1
[resultatBrut]: #core-ref:4c508940-f5a0-40ee-a942-6372a95d112e
[Doc]: #core-ref:1d557fb4-4eca-4ab8-a334-974fe563ddd2
[SearchDoc]: #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[DocumentList::addDocumentIdentifiers]: #core-ref:0fb2c846-e57a-402f-aa60-93379d05f90d
