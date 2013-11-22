# SearchDoc::setObjectReturn() {#core-ref:3a0b4882-81ff-4030-9f60-a0ed0ff1f958}

<div class="short-description">
Cette méthode permet de choisir le type de retour qui va être fait.
</div>


## Description {#core-ref:b8680419-addd-4728-9c98-50751396d357}

    [php]
    void setObjectReturn ( bool $returnobject = true )

Cette méthode permet de choisir le type de retour que va effectuer la méthode
[`SearchDoc::search`][search] ou [`SearchDoc::getDocumentList`][documentList].

Les deux types de retour possibles sont :

* [résultat brut][resultatBrut],
* [résultat objet documentaire][resultatDocumentaire].

### Avertissements {#core-ref:58959285-f58a-40a4-af2a-9597df191506}

Aucun.

## Liste des paramètres {#core-ref:83ed35cd-3e3a-403b-ac5f-d0e8e28bc0f6}

(bool) returnObject (valeur par défaut : `true`)
:   Si le paramètre est à `true` alors le retour est un objet documentaire,
 sinon c'est un résultat brut.

**Note** : Par défaut un searchDoc retourne des [`résultats brut`][resultatBrut].


## Valeur de retour {#core-ref:ef41586e-5cfe-4122-a66d-f2b52f655654}

void

## Erreurs / Exceptions {#core-ref:520b0b23-6c86-4c12-a9d1-502d75648b12}

Aucune.

## Historique {#core-ref:0ab0e250-c54a-45d3-b312-a5f32bf73ae7}

Aucun.

## Exemples {#core-ref:22a54e1d-c765-4147-8b19-d72c2c4faff1}

### Retour de document brut

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(false);
    $rawDocuments=$s->search();
    foreach ($rawDocuments as $docid=>$rawDoc) {
      printf("%d) %s (%s)", 
           $docid,
           $rawDoc["title"],
           $rawDoc["ba_desc"]);
    }


### Retour de document objet

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(true);
    $documentList=$s->search()->getDocumentList();
    foreach ($documentList as $docid=>$doc) {
      printf("%d) %s (%s)", 
           $docid,
           $doc->getTitle(),
           $doc->getRawValue(\Dcp\AttributeIdentifiers\Dir::ba_title));
    }


## Notes {#core-ref:867fcba6-94e7-403e-a523-73e20583a25f}

Aucune.

## Voir aussi {#core-ref:64551b8d-92e9-4814-9640-10f2ba0399b9}

*   [`SearchDoc::search`][search].
*   [Autres exemples][advancedExemple].

<!-- links -->

[resultatBrut]:             #core-ref:4c508940-f5a0-40ee-a942-6372a95d112e
[resultatDocumentaire]:     #core-ref:84a293c0-0ea6-428c-8da6-f8cc46980d5b
[search]:                   #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[reset]:                    #core-ref:39efa6f3-4d70-452c-b14b-891adca3a56d
[documentList]:             #core-ref:8f0824fa-eed6-4170-b52d-d3dc7c5cb9c1
[advancedExemple]:          #core-ref:d0a89548-a743-4dfc-bf43-49192ef1b6a8
[usecollection]:            #core-ref:881c9fcb-81c2-45af-b89f-70be3a7f24b7