# Doc::getLatestId() {#core-ref:3f238bd0-ca14-429d-a8fc-fd7552653efc}

<div class="short-description" markdown="1">

La méthode `getLatestId` permet d'obtenir l'identifiant de la dernière révision
du document.

</div>

## Description {#core-ref:8c2fbe72-5d33-4923-b31b-a91f08e89508}

    [php]
    int|bool(false) getLatestId ( bool $fixed      = false,
                                  bool $forcequery = false )

Si le document est révisable, ou est associé à un cycle de vie, alors la méthode
`getLatestId` permet d'obtenir l'identifiant de la dernière révision du
document.

### Avertissements {#core-ref:fb124089-7e73-4b91-945c-b7e46097ce3b}

Aucun.

## Liste des paramètres {#core-ref:c089c7eb-6d83-4e5c-aee7-7cde71a98f41}

(bool) `fixed`
:   `fixed` permet d'indiquer qu'on souhaite obtenir l'identifiant de la
    dernière révision figée (voir [propriété `lmodify`][doc_props]).
    
    Par défaut `fixed` vaut `false`, et c'est l'identifiant de la dernière
    révision qui est retourné (indépendamment du fait que ce soit une révision
    figée ou non).

(bool) `forcequery`
:   `forcequery` permet de forcer l'exécution d'une requête en base de données
    pour rechercher la dernière révision.
    
    Par défaut `forcequery` vaut `false`, et une nouvelle requête en base de
    données n'est pas exécutée pour la recherche de la dernière révision.
    Si ce paramètre n'est pas passé à `true` l'`id` retourné est le dernier `id`
    connu lors de la récupération du document en base.

## Valeur de retour {#core-ref:e6a28aef-c570-43d5-bcff-d979aa7d4941}

La méthode retourne l'identifiant de la dernière révision lorsque cette dernière
est trouvée, sinon le booléen `false` est retourné en cas d'erreur.

## Erreurs / Exceptions {#core-ref:b6bbf3e8-c7cb-4b43-9142-115551aeb1a6}

La méthode retourne `false` si :

* la propriété `id` du document est vide.

## Historique {#core-ref:05ecfdde-7e9a-4820-b4c4-6de11376c3b9}

### Release 3.2.5 {#core-ref:c6633d38-7061-45b0-9485-0974e256cd82}

La méthode `getLatestId` remplace la méthode précédemment nommée `latestId`.

L'utilisation de `latestId` est obsolète depuis la version 3.2.5 de
dynacase-core.

## Exemples {#core-ref:a30788e0-242a-490f-a99f-809f38275b7a}

- Exemple #1

    [php]
    /*
     * Obtenir l'identifiant de la dernière révision
     * de la facture.
     */
    $latestId = $facture->getLatestId();
    
    /*
     * Imprimer cette dernière révision de la facture.
     */
    imprimerFacture($latestId);

## Notes {#core-ref:0569d4c5-3650-46fd-abf9-762e72c11f40}

Aucune.

## Voir aussi {#core-ref:9e27f816-fb8e-4c70-85bf-3aa8f5c77d4f}

- [Propriété `lmodify`][doc_props]
- [`Doc::revise`][Doc::revise]

<!-- links -->
[doc_props]: #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353
[Doc::revise]: #core-ref:882e3730-0483-4dbc-9b9d-0d0b5cc31d38
