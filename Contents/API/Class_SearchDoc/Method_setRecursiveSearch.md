# SearchDoc::setRecursiveSearch() {#core-ref:b99a6125-5a8b-420b-b1ce-f6a459f11612}

<div class="short-description">
Lorsque la recherche est effectuée sur un dossier, celui-ci peut contenir des
 collections, il est possible de rechercher à l'intérieur de ces collections.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:f6fe1467-f050-47c2-90bb-9884d9f00785}

    [php]
    void setRecursiveSearch( $recursiveMode = true )

Lorsque la collection est un dossier, il est possible de faire des recherches
récursives à l'aide de la méthode `DocSearch::setRecursiveSearch()`. Le niveau
de profondeur de la recherche est ensuite défini au moyen de la propriété
`DocSearch::folderRecursiveLevel`, positionné à 2 par défaut.

### Avertissements {#core-ref:909e48c4-c3c2-4694-9965-0d161a868afc}

Ceci ne fonctionne que si la recherche est faite dans une collection spécifique
[`SearchDoc::useCollection()`][useCollection] et que cette collection est de 
type [dossier][dir].

## Liste des paramètres {#core-ref:668be5ce-6f5f-42c9-b6f5-0f2370bb353c}

(boolean) $recursiveMode (valeur par défaut : `true`)
:   Si le paramètre recursiveMode est passé à `true` alors la recherche est
    faite de manière récursive. Un searchDoc est paramétré pour effectuer une
    recherche non-récursive par défaut.

## Valeur de retour {#core-ref:7cf461ab-cd3e-4ea1-8d67-205bbea30c86}

N/A

## Erreurs / Exceptions {#core-ref:20728841-5cd5-4e64-b20c-d3e890930adb}

N/A

## Historique {#core-ref:e95b804b-4186-4382-9a65-942893fcbbd3}

N/A

## Exemples {#core-ref:60bf2e3c-3a51-45fb-bb17-6f80fec8a77d}

Voir le [chapitre avancé sur la recherche dans les collections][advancedCollection].

## Notes {#core-ref:3360506d-93b0-43d5-be19-605f56b5eaf2}

N/A

## Voir aussi {#core-ref:3cf86fa6-5f64-4740-9fb1-446eb4b1e780}

Voir le [chapitre avancé sur la recherche dans les collections][advancedCollection].

<!-- links -->

[useCollection]:        #core-ref:881c9fcb-81c2-45af-b89f-70be3a7f24b7
[dir]:                  #core-ref:977910df-1dc1-4def-9e0b-fb938f5d849f
[advancedCollection]:   #core-ref:7f084be4-ceb8-464d-81e4-8902da361aff