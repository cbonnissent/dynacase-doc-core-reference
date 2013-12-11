# SearchDoc::getDocumentList() {#core-ref:8f0824fa-eed6-4170-b52d-d3dc7c5cb9c1}

<div class="short-description"> 
Cette méthode retourne un objet DocumentList associé à l'objet SearchDoc.
Cet objet permet d'itérer sur les résultats obtenu par l'objet SearchDoc. 
</div>


## Description {#core-ref:591def36-d935-490c-bf2b-d10d2bf323f5}

    [php]
    DocumentList getDocumentList ( )

### Avertissements {#core-ref:84e81039-9ab9-4cc0-b99d-58cc98ed8b13}

L'exécution de la méthode [`SearchDoc::search`][search] n'est pas nécessaire
avant l'utilisation de `::getDocumentList()`. Si cette méthode est appelée avant
l'itération, elle ne sera pas exécutée lors de l'itération. Dans le cas
contraire, la méthode [`SearchDoc::search`][search] sera appelée dès le début de
l'itération.

## Liste des paramètres {#core-ref:ba27435d-dd93-4714-aaa8-7cc58752f4a7}

Aucun.

## Valeur de retour {#core-ref:acea8165-0d2c-462f-8ddc-8f02b64aee2d}

Un objet de type [`DocumentList`][DocumentList].

## Erreurs / Exceptions {#core-ref:d544412c-bb54-473f-b437-39bf41a1dba1}

Aucune.

## Historique {#core-ref:5ff0e894-d663-4a13-8518-d68208771f6b}

Aucun.

## Exemples {#core-ref:31668f2c-a644-484c-8488-7f65404d62d2}

## Retour d'objets documentaires {#core-ref:b32fc6c8-f7a1-43c2-935e-be97e2c13165}

Récupère la liste des documents de la famille "dossiers" :

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(true);
    $s->search();
    
    $documentList=$s->getDocumentList();
    
    foreach ($documentList as $docid=>$doc) {
        printf("%d) %s (%s)\n", 
               $docid,
               $doc->getTitle(),
               $doc->getRawValue(\Dcp\AttributeIdentifiers\Dir::ba_desc, "Pas de description"));
    }

Résultat :

    3590) mimetypes (Pas de description)
    1436) Porte-document (porte-documents de Default Master)
    9) Racine (Pas de description)


## Retour de valeurs brutes  {#core-ref:4ebd171c-2d25-4605-8d5a-d93f085871b7}

Récupère la liste des données des "dossiers" :

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(false);
    $s->search();
    
    $documentList=$s->getDocumentList();
    
    foreach ($documentList as $docid=>$doc) {
      printf("%d) %s (%s)\n", 
         $docid,
         $doc["title"],
         empty($doc[\Dcp\AttributeIdentifiers\Dir::ba_desc])
            ?"Pas de description"
            :($doc[\Dcp\AttributeIdentifiers\Dir::ba_desc]));
    }

Résultat :

    3590) mimetypes (Pas de description)
    1436) Porte-document (porte-documents de Default Master)
    9) Racine (Pas de description)

## Notes {#core-ref:3625d836-613b-4bb2-834a-e39e02a208af}

Aucun.

## Voir aussi {#core-ref:f229a5d7-3c10-4b52-8ccb-e489db6ab234}

*   [Classe `DocumentList`][DocumentList],
*   [Recherche avancée][advancedIterator].

<!-- links -->

[SearchDoc]:            #core-ref:a5216d5c-4e0f-4e3c-9553-7cbfda6b3255
[DocumentList]:         #core-ref:23c71c28-dbce-4d34-819a-50d5bc4a38c3
[search]:               #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[advancedIterator]:     #core-ref:2097dfea-e13b-4fb3-be10-f346c2171228