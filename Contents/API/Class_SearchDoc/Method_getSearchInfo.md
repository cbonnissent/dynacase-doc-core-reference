# SearchDoc::getSearchInfo() {#core-ref:5dd38712-3618-42e2-8766-23f439b01d56}

<div class="short-description">
Cette méthode permet d'avoir des informations sur l'exécution de la recherche.
</div>

## Description {#core-ref:c4d360ab-a50d-4a75-9986-1257a75ff0be}

    [php]
    array getSearchInfo()


### Avertissements {#core-ref:8eaa2a1c-d9ce-45a1-b028-5ba1cb3910ae}

Cette méthode est utilisable qu'après avoir exécutée la méthode
[`search()`][search].

## Liste des paramètres {#core-ref:a534215c-a61a-4ced-8d0a-75c034c6cb60}

Aucun.

## Valeur de retour {#core-ref:4f0f2043-f226-421e-9cca-ca9f51a0a7fc}

array
:   Le array contient les clefs suivantes :
    
     * **`count`** : nombre de résultats de la requête,
     * **`query`** : requête `SQL` générée,
     * **`error`** : message d'erreur si il y a eu une erreur lors de la 
     préparation de la requête,
     * **`delay`** : temps d'exécution de la requête.

**Note** : Si la méthode
[`search()`][search] n'a pas été exécutée alors une chaîne vide est retournée.

## Erreurs / Exceptions {#core-ref:0a081f26-b771-41e9-95b6-e7d59f24b92f}

Aucune.

## Historique {#core-ref:5a849bb0-570f-494c-9872-5f1b9be0c9ce}

Aucun.

## Exemples {#core-ref:fe4f2f30-1a38-471b-b6ea-0b4f40689a4c}

Recherche des cinq premiers dossiers :

    [php]
    $s=new SearchDoc("","DIR");
    $s->setObjectReturn(true);
    $s->setSlice(5);
    $s->setOrder('initid');
    $s->search();
    
    print_r($s->getSearchInfo());


Résultat :

    Array
    (
        [count] => 5
<!--beware there is no tab here for sql syntax-->

    [sql]
        [query] => select doc2.id, owner, title, ..., ba_title, ba_desc, ... 
            from doc2  
            where (doc2.archiveid is null) and (doc2.doctype != 'T') and (doc2.locked != -1) 
            ORDER BY initid LIMIT 5 OFFSET 0;

        [error] => 
        [delay] => 0.340s
    )

## Notes {#core-ref:d3015e40-f3a3-4bb7-a414-d104a8e47cdf}

Aucune.

## Voir aussi {#core-ref:74e27f2c-2805-4541-986c-96022c9d5824}

*   [`SearchDoc::search()`][search]

<!-- links -->
[search]:   #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08