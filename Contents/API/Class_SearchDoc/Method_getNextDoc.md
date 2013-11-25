# SearchDoc::getNextDoc() {#core-ref:2367bd7b-d57a-4f8d-83df-2e92a7e38ed1}

<div class="short-description">
Cette fonction permet de d'itérer sur la liste des documents trouvés par la 
recherche.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:6ff7c9b1-5c65-48f5-9707-3341426f36f3}

    [php]
    Doc|Array|null getNextDoc()

Aucun.

### Avertissements {#core-ref:558aa4c8-0cfb-44b6-8313-ddd9c0e0510b}

Aucun.

## Liste des paramètres {#core-ref:04f7ef01-58cd-46c8-b661-3a46dc02fc80}

Aucun.

## Valeur de retour {#core-ref:5640006d-f5d9-4dba-8295-3d6598df4071}

La valeur de retour peut être :

* `array` : si le type de recherche n'est [object][objectReturn],
* `Doc` :   si le type de recherche est [object][objectReturn],
* `null` :  si tous les documents ont été parcouru.

## Erreurs / Exceptions {#core-ref:4e599b72-7039-41f7-8160-7b1856040173}

Aucun.

## Historique {#core-ref:4bf1de3b-bc20-4eee-addd-552c9728820a}

Aucun.

## Exemples {#core-ref:48e71bd4-b673-4111-b07f-e8a90c9c6773}

Itération sur les tous les documents :

    [php]
    function iterOnDocument(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new searchDoc();
        $searchDoc->setObjectReturn(true);
        $searchDoc->search();
        
        $err = $searchDoc->getError();
        if ($err !== "") {
            throw new Exception("Error Processing Search ".$err, 1);
        }
        
        while($document = $searchDoc->getNextDoc()) {
            print $document->getTitle()."\n";
        }
        
        var_export($searchDoc->getSearchInfo());
        
    }


## Notes {#core-ref:09c89d91-b92c-4216-98df-7d2514d9fd10}

Vous pouvez obtenir le même résultat en utilisant la méthode 
[`SearchDoc::getDocumentList`][documentList].

## Voir aussi {#core-ref:683da3d7-b3ac-4694-bd81-d1a5458e2998}

Aucun.

<!-- links -->

[objectReturn]:         #core-ref:3a0b4882-81ff-4030-9f60-a0ed0ff1f958
[documentList]:         #core-ref:8f0824fa-eed6-4170-b52d-d3dc7c5cb9c1