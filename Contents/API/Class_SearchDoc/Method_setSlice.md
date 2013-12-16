# SearchDoc::setSlice() {#core-ref:298603d5-ee5e-4c61-81b7-51b699dc670e}

<div class="short-description">
Cette méthode permet de définir le nombre maximal de résultats retournés.
</div>


## Description {#core-ref:0e9184f8-e46f-4f64-9a35-2b32235c600c}

    [php]
    bool setSlice( int|string $slice )

### Avertissements {#core-ref:adcce95a-8a15-4d35-b3f6-dc331630eb46}

La méthode [`::count()`][searchcount] retourne le nombre de résultats et ne peut
pas excéder la valeur du paramètre `$slice`.

Il faut toujours définir un ordre à la recherche afin de garantir une fenêtre de 
résultat non ambiguë.

## Liste des paramètres {#core-ref:61bc4709-c2cb-43c3-a7b6-47ddb29dadbe}

(int|string) `setSlice`
:   Nombre maximum de résultats retournés. Ce nombre peut-être soit un entier 
    positif, soit `ALL`. `ALL` indique que tous les résultats sont retournés.

## Valeur de retour {#core-ref:13448eb7-caab-44cb-9f0f-fcee6fb4ed2b}

(bool) : `true` si le paramètre est appliqué, `false` sinon.

**Note** : Le paramètre n'est pas appliqué si il n'est pas un entier ou s'il 
n'est pas `ALL`.

## Erreurs / Exceptions {#core-ref:89f22242-d028-4581-b311-5f6f2f1c7fb4}

Aucun.

## Historique {#core-ref:e7625520-62af-4824-b6a6-9937e4d10397}

Aucun.

## Exemples {#core-ref:a1f55038-cbd3-44b3-994e-97e67b5ddd55}


Retourner les 10 premiers résultats.

    [php]
    $searchDoc = new SearchDoc("", "IUSER");
    $searchDoc->setOrder('title, initid');
    $searchDoc->setSlice(10);
    $documents = $searchDoc->search();


## Notes {#core-ref:bdbec912-0084-4a0b-8eec-43b88e32e427}

Aucune.

## Voir aussi {#core-ref:0e406a72-9e28-41de-b95d-ee14dc822f2a}

Voir [`SearchDoc::setStart()`][setStart]

<!-- link -->

[setStart]:        #core-ref:2527bda4-acc9-42ed-99e0-2ecbd6254a8e
[searchcount]:     #core-ref:8daca9d1-69e9-4871-b661-d710b8727d41
[onlycount]:       #core-ref:2d43be1a-1991-42dd-a25d-5c3bb0b393fa
