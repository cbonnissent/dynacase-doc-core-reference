# SearchDoc::count() {#core-ref:8daca9d1-69e9-4871-b661-d710b8727d41}

<div class="short-description">
Cette méthode permet de compter le nombre de résultats après que la recherche ait
été effectuée.
</div>


## Description {#core-ref:5ea5c9d5-9fe5-40bc-9bd2-cd993902727e}

    [php]
    int count ( )


### Avertissements {#core-ref:2f337ecf-3251-45c9-a882-c4b54dc5e861}

La fonction [`SearchDoc::search`][search] doit être exécutée avant `count` sinon
le résultat retourné est `-1`. Si le but est simplement de compter le nombre de
résultats, il est préférable d'utiliser [`onlyCount`][onlyCount] qui est
optimisé pour faire uniquement le décompte et ne nécessite pas de récupérer le
résultat de la recherche.

Si des nouveaux critères sont ajoutés après l'exécution de la fonction
[`SearchDoc::search`][search], il faut effectuer de nouveau la fonction
[`SearchDoc::search`][search] pour que la fonction `count` prenne en compte les
nouveaux critères.

## Liste des paramètres {#core-ref:1780015f-371f-4f9e-a1c3-5dbde80df9e9}

Aucun.

## Valeur de retour {#core-ref:385ea8c3-5594-44cf-a18d-2f5c4293b17f}

Deux cas :

* soit un entier représentant le nombre de résultat,
* si la fonction [`SearchDoc::search`][search] n'a pas été exécutée `-1`.

## Erreurs / Exceptions {#core-ref:ab91273c-3f68-493b-9e7a-69575b77160d}

Aucune.

## Historique {#core-ref:e312aabe-70ac-47d2-bc05-a4ed85fa9ecc}

### Release 3.2.12

Si `count()` est appelé avant `search()`, le résultat est `-1`. Il était
auparavant égal à `0`.

Le résultat du `count()` n'était pas réinitialisé en cas de recherches
successives si le [type de retour][setobjectreturn] était "objet documentaire".
Il fallait dans ce cas, appeler la méthode [`reset()`][reset] avant l'appel à
`search()`.

## Exemples {#core-ref:d71ce1dc-c188-4057-bd02-9c498f18e225}

Compte le nombre total de documents :

    [php]
    function countAllTheDoc(Action & $action)
    {
        header('Content-Type: text/plain');
        
        $searchDoc = new SearchDoc();
        $searchDoc->setObjectReturn(true);
        
        $document = $searchDoc->search();
        
        var_export($searchDoc->count());
    }

**Note** : Si le but est simplement de compter le nombre de
résultats, il est préférable d'utiliser [`onlyCount`][onlyCount].

## Notes {#core-ref:75898fbd-55b2-4d4b-baf4-3e61f328414e}

Aucunes.

## Voir aussi {#core-ref:5d9ebb0a-639d-440e-a6ff-e248d8253f03}

*   [`DocSearch::onlyCount()`][onlyCount]
*   [`DocSearch::search()`][search]

<!-- links -->

[search]:       #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[onlyCount]:    #core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa
[reset]:        #core-ref:39efa6f3-4d70-452c-b14b-891adca3a56d
[setobjectreturn]: #core-ref:3a0b4882-81ff-4030-9f60-a0ed0ff1f958