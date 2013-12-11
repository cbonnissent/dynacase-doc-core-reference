# SearchDoc::overrideViewControl() {#core-ref:18f98a7d-7db0-4270-97b2-0a1759a5b0e6}

<div class="short-description">
    
Cette méthode permet de rechercher aussi parmi les document que l'utilisateur
n'a pas le droit de voir.

</div>


## Description {#core-ref:a569b274-87b4-4181-995c-d65983b03ee7}

    [php]
    void overrideViewControl (  )

Par défaut, la méthode [`::search()`][search] ajoute un filtre permettant de ne
retourner que les document que l'utilisateur courant peut voir.

Cette méthode permet de ne pas tenir compte du droit [`view`][viewACL], tous les
documents existants sont alors trouvés que l'utilisateur en cours
n'ait ou pas le droit de le voir.

### Avertissements {#core-ref:063ad594-da2a-46c3-82ab-9f64f5ebdace}

Aucun.

## Liste des paramètres {#core-ref:37f60ce1-7dc2-446e-b2ad-4e31941d75ec}

Aucun.

## Valeur de retour {#core-ref:13791579-fa97-4591-84df-c07230a365ca}

Aucune.

## Erreurs / Exceptions {#core-ref:09fbb635-3b94-40cc-8a95-9998537dbad7}

Aucune.

## Historique {#core-ref:593062b2-1ea3-4fcf-aaaa-fa52e56b5669}

Anciennement `::noViewControl()`.

## Exemples {#core-ref:3fe82be2-25ad-4f31-b945-cff5423de60d}

Soit `FILM`, une famille décrivant les caractéristiques de films.

Compter le nombre total de film :

    [php]
    $searchDoc = new SearchDoc("", "FILM");
    $searchDoc->overrideViewControl();
    $numberOfUsers=$searchDoc->onlyCount();

Si la méthode `::overrideViewControl()` n'était pas appelée, le compte retourné
serait le nombre de films que l'utilisateur a le droit de voir

## Notes {#core-ref:b2de38af-fa78-4f43-838d-0e4d32b9d9f6}

Aucune.

## Voir aussi {#core-ref:27ad0818-e83d-4e74-a94d-de4c10d38392}

*   [Recherche en fonction des droits][advview],
*   [Recherche sur les autres droits][docperm].
*   [`SearchDoc::excludeconfidential`][excludeconfidential]

<!-- links -->
[viewACL]:      #core-ref:f1575705-10e8-4bf2-83b3-4c0b5bfb77cf
[docperm]:      #core-ref:5cf15b7a-e8c8-4ec8-a3b8-2e676b6be349
[advview]:      #core-ref:8fd719e9-cc92-4ca4-822c-911a9fee10bf
[search]:       #core-ref:6f5cc024-66e4-429e-9071-67d4523a8e08
[excludeconfidential]: #core-ref:17be152c-0844-40d5-bfc5-a9aa2f2695fc