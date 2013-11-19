# SearchDoc::getSearchInfo() {#core-ref:5dd38712-3618-42e2-8766-23f439b01d56}

<div class="short-description">
Cette méthode permet d'avoir des informations sur l’exécution de la recherche.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:c4d360ab-a50d-4a75-9986-1257a75ff0be}

    [php]
    Array getSearchInfo()


### Avertissements {#core-ref:8eaa2a1c-d9ce-45a1-b028-5ba1cb3910ae}

N/A

## Liste des paramètres {#core-ref:a534215c-a61a-4ced-8d0a-75c034c6cb60}

N/A

## Valeur de retour {#core-ref:4f0f2043-f226-421e-9cca-ca9f51a0a7fc}

Array
:   Le array contient les clefs suivantes :
    
     * **count** : nombre de résultats de la requête,
     * **query** : requête `SQL` générée,
     * **error** : message d'erreur si il y a eu une erreur lors de la préparation de la requête,
     * **delay** : temps d'exécution de la requête.

**Note** : Si le searchDoc n'a pas été exécuté alors une chaîne vide est retournée.

## Erreurs / Exceptions {#core-ref:0a081f26-b771-41e9-95b6-e7d59f24b92f}

N/A

## Historique {#core-ref:5a849bb0-570f-494c-9872-5f1b9be0c9ce}

N/A

## Exemples {#core-ref:fe4f2f30-1a38-471b-b6ea-0b4f40689a4c}

Retourne la liste des informations

    [php]
    function getSearchInfo(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new SearchDoc();
        $searchDoc->setObjectReturn(true);
        var_export($searchDoc->getSearchInfo());
        
        $searchDoc->search();
        
        $err = $searchDoc->getError();
        if ($err !== "") {
            throw new Exception("Error Processing Search ".$err, 1);
        }
        
        var_export($searchDoc->getSearchInfo());
    
    }

## Notes {#core-ref:d3015e40-f3a3-4bb7-a414-d104a8e47cdf}

N/A

## Voir aussi {#core-ref:74e27f2c-2805-4541-986c-96022c9d5824}

N/A
