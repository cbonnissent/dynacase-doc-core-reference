# SearchDoc::useCollection() {#core-ref:881c9fcb-81c2-45af-b89f-70be3a7f24b7}

<div class="short-description">
Cette méthode permet de définir que la recherche a pour base une collection, 
seul les documents contenu dans cette collection sont trouvés.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:6726ff78-e93a-4b14-ac17-b8d2f0298f1d}

    [php]
    bool useCollection( $dirid )

La collection indiquée en entrée dans la fonction peut être soit un dossier, 
une recherche ou encore un rapport.

### Avertissements {#core-ref:54e9705a-8bf0-4325-b595-e5f88226d9c6}

Aucun.

## Liste des paramètres {#core-ref:eea6abe1-2f54-49e0-bd17-c643a9244d11}

(string|int) $dirid
:   La fonction prend en entrée la référence vers une collection que ça soit 
    par son nom logique ou par son identifiant.

## Valeur de retour {#core-ref:d4600e90-91c9-4bc1-a83c-c942473e9a43}

(bool) `true` si le paramètre a pu être appliqué `false` sinon.

## Erreurs / Exceptions {#core-ref:9e66ad5c-8c28-4f07-8497-d616640bc3f0}

Si jamais la référence passée en entrée n'est pas valide la fonction retourne
`false` et log un message d'erreur sur le searchDoc 
(voir [`SearchDoc::getError`][searchDocGetError])

## Historique {#core-ref:b89f1e07-24b7-4664-b6bd-c95b28e41e73}

Aucun.

## Exemples {#core-ref:df3ddd1e-0aca-4de4-8786-e7e09942e28f}

Un exemple est disponible dans le [chapitre avancé][advancedUseCollection].

## Notes {#core-ref:5bb0ac80-40d8-4eb2-8232-1ef47471c64f}

Aucun.

## Voir aussi {#core-ref:3dcb20cd-3e84-4d9b-ad56-956af84494df}

Le chapitre avancé sur la [recherche dans les collections][advancedUseCollection].

<!-- links -->

[searchDocGetError]:        #core-ref:e57302ed-319e-4d63-b817-7a22d0ead3f2
[advancedUseCollection]:    #core-ref:7f084be4-ceb8-464d-81e4-8902da361aff