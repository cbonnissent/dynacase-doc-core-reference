# SearchDoc::excludeConfidential() {#core-ref:17be152c-0844-40d5-bfc5-a9aa2f2695fc}

<div class="short-description">
Cette méthode permet d'exclure les documents marqués comme confidentiel.
</div>


## Description {#core-ref:4798fa87-48ef-4a33-97f7-c7d94c0213a5}

    [php]
    bool excludeConfidential ( $exclude = true )

Il est possible de marquer des documents comme confidentiels ceux-ci sont alors
trouvés dans les recherches mais ne sont pas consultables si l'utilisateur n'en
a pas le droit. Cette méthode permet d'exclure ces documents.

### Avertissements {#core-ref:ebdc7e22-1f94-4b93-b3b2-9efbd65e4247}

Aucun.

## Liste des paramètres {#core-ref:2d01bcf2-35ba-4faa-a90d-89c2ebaf318c}

(bool) $exclude (valeur par défaut : `true`)
:   Si la valeur est à `true` alors les documents confidentiels sont exclus, 
    si la valeur est à `false` ils sont inclut. Un document searchDoc les inclut
    par défaut.

## Valeur de retour {#core-ref:4e29d1b2-0ca1-46c0-a5dc-f0ad378d4130}

void

## Erreurs / Exceptions {#core-ref:a4c949dc-629f-4f4d-a858-7fc24b8bd31b}

Aucun.

## Historique {#core-ref:991ead7d-149b-4ff0-9cd5-29de4fc03ad4}

Aucun.

## Exemples {#core-ref:e132ede4-6a51-43c6-a862-3e269fa89283}

Aucun.

## Notes {#core-ref:8c27a9a8-9c7c-4906-bc95-52b009c5519e}

Aucun.

## Voir aussi {#core-ref:ac916fed-9757-4c6f-b908-0277656b37eb}

Le chapitre de sécurité avancé sur la [recherche des confidentiels][advancedConfidential].

<!-- links -->

[advancedConfidential]:         #core-ref:5da495b6-7e9f-4063-a254-3689bb786389