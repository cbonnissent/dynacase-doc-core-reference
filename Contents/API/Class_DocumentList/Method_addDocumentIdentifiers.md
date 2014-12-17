# DocumentList::addDocumentIdentifiers() {#core-ref:0fb2c846-e57a-402f-aa60-93379d05f90d}

<div class="short-description" markdown="1">

La méthode `addDocumentIdentifiers` permet d'obtenir les dernières
[révisions][revision] (`latest`) d'un ensemble de documents à partir de la liste
des identifiants de ces documents.

</div>

## Description {#core-ref:53fc40ed-2893-4e49-98f0-92bd0a0861b8}

    [php]
    void addDocumentIdentifiers ( array[int] $ids,
                                        bool $useInitId = true )

La méthode `addDocumentIdentifiers` permet d'obtenir les dernières
[révisions][revision] (`latest`) des documents dont les identifiants sont passés
en argument sous la forme d'une liste d'identifiants.

Les identifiants de la liste peuvent être des `initid`, des `id` de révisions
intermédiaire ou bien des `id` de dernière révision (`latest`).

La méthode initialise alors l'objet `DocumentList` courant pour retourner tous
ces différents documents dans leur dernière révision (`latest`).

### Avertissements {#core-ref:fa34b58b-bfb4-4706-a3e9-45119f725f38}

Aucun.

## Liste des paramètres {#core-ref:bcd5d96b-9684-4ce1-875d-7197673ac8d8}

(array[int]) `ids`
:   `ids` contient la liste des identifiants des documents avec lesquels on
    souhaite initialiser l'objet [`DocumentList`][DocumentList].

(bool) `useInitId`
:   `useInitId` permet de spécifier si les identifiants fournis sont des
    [`initid`][doc_props] ou des identifiants de dernière révision.
    
    Par défaut, `useInitId` vaut `true`, et les identifiants spécifiés doivent
    être des `initid`.

## Valeur de retour {#core-ref:3fb28f06-8a73-45b2-ac4e-423ba62138ba}

Les éléments accessibles par itération sur `DocumentList` sont des objet dérivés
de la classe `Doc`.

## Erreurs / Exceptions {#core-ref:46c4fa05-c138-41e1-8df4-bdfe34e49a9b}

Aucune.

## Historique {#core-ref:70675b69-9a35-4c9f-88cb-fee83f19b5a5}

Aucun.

## Exemples {#core-ref:15f8b125-ba41-4f5a-a3e0-b0fbcbe50abb}

Soit les documents suivants :

- Document #1 d'`initid` 3973 et les révisions suivantes.

     initid |  id  | locked | revision |    title    
    --------+------+--------+----------+-------------
       3973 | 3973 |     -1 |        0 | Foo
       3973 | 3974 |     -1 |        1 | Foo Bar
       3973 | 3975 |     -1 |        2 | Foo Bar Baz
       3973 | 3976 |      0 |        3 | Foo Bar Baz

- Document #2 d'`initid` 3977 et les révisions suivantes.

     initid |  id  | locked | revision |        title        
    --------+------+--------+----------+---------------------
       3977 | 3977 |     -1 |        0 | The
       3977 | 3978 |     -1 |        1 | The Quick
       3977 | 3979 |     -1 |        2 | The Quick Brown
       3977 | 3980 |     -1 |        3 | The Quick Brown Fox
       3977 | 3981 |      0 |        4 | The Quick Brown Fox

### Avec Initid {#core-ref:a143a3c3-7973-4c3a-863f-87cc2f858d51}

Lorsque `useInitId` est à `true` (valeur par défaut), les identifiants fournis
doivent être des `initid`.

Si un identifiant n'est pas un `initid`, alors il n'est pas retourné par l'objet
`DocumentList`.

    [php]
    $documentList = new \DocumentList();
    
    $documentList->addDocumentIdentifiers(
        array(
            3973, /* document #1 @ revision 0 (initid) */
            3981  /* document #2 @ revision 4 (latest) */
        )
    );
    
    foreach ($documentList as $docId => $doc) {
        printf("* Document {id = '%d', revision = '%d', title = '%s'}.\n", $docId, $doc->getProperty('revision'), $doc->getTitle());
    }

Résultat :

    * Document {id = '3976', revision = '3', title = 'Foo Bar Baz'}.

Seul document#1 est retourné (car spécifié avec son `initid`) et à sa dernière
révision (3).

### Avec Latest Id {#core-ref:dd4ecd1b-c51a-46c6-881f-2d26a663ea75}

Lorsque `useInitId` est à `false`, les identifiants fournis doivent être des
identifiants de dernière révision (`latest`).

Si un identifiant n'est pas un identifiant de dernière révision, alors il n'est
pas retourné par l'objet `DocumentList`.

    [php]
    $documentList = new \DocumentList();
    
    $documentList->addDocumentIdentifiers(
        array(
            3973, /* document #1 @ revision 0 (initid) */
            3981  /* document #2 @ revision 4 (latest) */
        ),
        false
    );
    
    foreach ($documentList as $docId => $rawDoc) {
        printf("* Document {id = '%d', revision = '%d', title = '%s'}.\n", $docId, $doc->getProperty('revision'), $doc->getTitle());
    }

Résultat :

    * Document {id = '3981', revision = '4', title = 'The Quick Brown Fox'}.

Seul document#2 est retourné (car spécifié avec son `latest` id) et à sa
dernière révision (4).

### Pour n'importe quel identifiant {#core-ref:efa1e36e-da64-4504-8c75-0666688279d8}

Si les identifiants fournis ne sont ni `initid` ni `latest`, alors, pour obtenir
les documents correspondants il faudra modifier la propriété `latest` de l'objet
`SearchDoc` sous-jacent comme suit :

    [php]
    $documentList = new \DocumentList();
    /*
     * Fournir les identifiants avec `useInitId` à `false`
     */
    $documentList->addDocumentIdentifiers(
        array(
            3974, /* document #1 @ revision 1*/
            3978  /* document #2 @ revision 1 */
        ),
        false
    );
    
    /*
     * Récupérer l'objet `SearchDoc` sous-jacent
     */
    $search = $documentList->getSearchDocument();
    
    /*
     * Positionner SearchDoc->latest à `false`
     */
    $search->latest = false;
    
    foreach ($documentList as $docId => $rawDoc) {
        printf("* Document {id = '%d', revision = '%d', title = '%s'}.\n", $docId, $doc->getProperty('revision'), $doc->getTitle());
    }

Résultat :

    * Document {id = '3974', revision = '1', title = 'Foo Bar'}.
    * Document {id = '3978', revision = '1', title = 'The Quick'}.

Les documents #1 et #2 sont retournés avec les documents aux révisions des
identifiants demandés.

## Notes {#core-ref:a2c98be2-9502-4e00-8d5d-3d537afd3396}

Les documents obtenus via `DocumentList` sont ordonnés alphabétiquement par leur
titre.

## Voir aussi {#core-ref:87e7a276-295b-433e-a244-11637b149e6c}

- [DocumentList][DocumentList]
- [SearchDoc][SearchDoc]

<!-- links -->
[doc_props]: #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353
[DocumentList]: #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[SearchDoc]: #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[revision]: #core-ref:1cdff481-42e0-4caf-baba-d2348d760ca5
