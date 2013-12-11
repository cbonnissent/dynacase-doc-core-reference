# SearchDoc::setRecursiveSearch() {#core-ref:b99a6125-5a8b-420b-b1ce-f6a459f11612}

<div class="short-description">
Lorsque la recherche est effectuée sur un dossier, celui-ci peut contenir des
 sous-dossier, il est possible de rechercher à l'intérieur de ces sous-dossier.
</div>


## Description {#core-ref:f6fe1467-f050-47c2-90bb-9884d9f00785}

    [php]
    void setRecursiveSearch( int $recursiveMode = true 
                             int $level         = 2    )

Lorsque la collection est un dossier, il est possible de faire des recherches
récursives à l'aide de la méthode `DocSearch::setRecursiveSearch()`. Le niveau
de profondeur de la recherche est  défini au moyen de l'argument `$level`.

### Avertissements {#core-ref:909e48c4-c3c2-4694-9965-0d161a868afc}

Ceci ne fonctionne que si la recherche est faite dans une collection spécifique
[`SearchDoc::useCollection()`][useCollection] et que cette collection est de 
type [dossier][dir]. 

Les recherches contenues dans les sous-dossiers ne sont pas inspectées.

## Liste des paramètres {#core-ref:668be5ce-6f5f-42c9-b6f5-0f2370bb353c}

(bool) `recursiveMode` (valeur par défaut : `true`)
:   Si le paramètre recursiveMode est passé à `true` alors la recherche est
    faite de manière récursive. Un searchDoc est paramétré pour effectuer une
    recherche non-récursive par défaut.
    
(int) `level` (valeur par défaut : `2`)
:   Niveau de profondeur maximum d'inspection des sous-dossier. S'il est égal
    à zéro, aucun sous-dossier n'est inspecté.

## Valeur de retour {#core-ref:7cf461ab-cd3e-4ea1-8d67-205bbea30c86}

Void.

## Erreurs / Exceptions {#core-ref:20728841-5cd5-4e64-b20c-d3e890930adb}

Exception \Dcp\SearchDoc\Exception si le `$level`, n'est pas en entier positif
ou égal à zéro.

## Historique {#core-ref:e95b804b-4186-4382-9a65-942893fcbbd3}

### Release 3.2.12 {#core-ref:9704bf16-3d6c-4285-95fa-e505c56354ec}

Ajout du paramètre `$level` pour indiquer le niveau de profondeur. Auparavant,
il fallait mettre à jour la propriété `folderRecursiveLevel` pour indiquer le
niveau.

## Exemples {#core-ref:60bf2e3c-3a51-45fb-bb17-6f80fec8a77d}

Recherche de tous les documents contenus dans le dossier `MY_FOLDER` jusqu'à
trois niveaux de profondeur.

    [php]
    $search = new \SearchDoc(self::$dbaccess);
    $search->setObjectReturn();
    $search->useCollection("MY_FOLDER");
    $search->setRecursiveSearch(true, 3);
    $search->search();

Recherche de tous les sous-dossiers du dossier `MY_FOLDER` jusqu'à
trois niveaux de profondeur dont la description contient _"important"_.

    [php]
    $search = new \SearchDoc(self::$dbaccess, "DIR");
    $search->setObjectReturn();
    $search->useCollection("MY_FOLDER");
    $search->setRecursiveSearch(true, 3);
    $search->addFilter("%s ~ 'important", \Dcp\AttributeIdentifiers\Dir::ba_desc);
    $search->search();

## Notes {#core-ref:3360506d-93b0-43d5-be19-605f56b5eaf2}

Aucune.

## Voir aussi {#core-ref:3cf86fa6-5f64-4740-9fb1-446eb4b1e780}

Voir le [chapitre avancé sur la recherche dans les
collections][advancedCollection].

<!-- links -->

[useCollection]:        #core-ref:881c9fcb-81c2-45af-b89f-70be3a7f24b7
[dir]:                  #core-ref:977910df-1dc1-4def-9e0b-fb938f5d849f
[advancedCollection]:   #core-ref:7f084be4-ceb8-464d-81e4-8902da361aff