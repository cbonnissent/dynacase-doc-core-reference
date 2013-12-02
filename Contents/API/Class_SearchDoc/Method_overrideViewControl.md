# SearchDoc::overrideViewControl() {#core-ref:18f98a7d-7db0-4270-97b2-0a1759a5b0e6}

<div class="short-description">
    
Cette méthode permet de rechercher aussi parmi les document que l'utilisateur
n'a pas le droit de voir.

</div>


## Description {#core-ref:a569b274-87b4-4181-995c-d65983b03ee7}

    [php]
    void overrideViewControl (  )

Cette méthode permet de ne pas tenir compte du droit [`view`][viewACL], tous les
documents existants et applicables sont alors trouvés que l'utilisateur en cours
n'ait ou pas le droit de le voir.

### Avertissements {#core-ref:063ad594-da2a-46c3-82ab-9f64f5ebdace}

Aucun.

## Liste des paramètres {#core-ref:37f60ce1-7dc2-446e-b2ad-4e31941d75ec}

Aucun.

## Valeur de retour {#core-ref:13791579-fa97-4591-84df-c07230a365ca}

Aucun.

## Erreurs / Exceptions {#core-ref:09fbb635-3b94-40cc-8a95-9998537dbad7}

Aucune.

## Historique {#core-ref:593062b2-1ea3-4fcf-aaaa-fa52e56b5669}

Aucun.

## Exemples {#core-ref:3fe82be2-25ad-4f31-b945-cff5423de60d}



## Notes {#core-ref:b2de38af-fa78-4f43-838d-0e4d32b9d9f6}

Aucune.

## Voir aussi {#core-ref:27ad0818-e83d-4e74-a94d-de4c10d38392}

*   [Recherche en fonction des droits][advview],
*   [Recherche sur les autres droits][docperm].

<!-- links -->

[viewACL]:      #core-ref:f1575705-10e8-4bf2-83b3-4c0b5bfb77cf
[docperm]:      #core-ref:5cf15b7a-e8c8-4ec8-a3b8-2e676b6be349
[advview]:      #core-ref:8fd719e9-cc92-4ca4-822c-911a9fee10bf