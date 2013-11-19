# SearchDoc::setSlice() {#core-ref:298603d5-ee5e-4c61-81b7-51b699dc670e}

<div class="short-description">
Cette méthode permet de définir le nombre maximal de résultats.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:0e9184f8-e46f-4f64-9a35-2b32235c600c}

    [php]
    boolean setSlice( $slice )

### Avertissements {#core-ref:adcce95a-8a15-4d35-b3f6-dc331630eb46}

N/A

## Liste des paramètres {#core-ref:61bc4709-c2cb-43c3-a7b6-47ddb29dadbe}

(int|string) setSlice
:   Nombre maximum de résultats retournés. Ce nombre peut-être soit un entier 
    positif, soit `ALL`.

## Valeur de retour {#core-ref:13448eb7-caab-44cb-9f0f-fcee6fb4ed2b}

(boolean) : `true` si le paramètre est appliqué, `false` sinon.

**Note** : Le paramètre n'est pas appliqué si il n'est pas un entier ou s'il 
n'est pas `ALL`.

## Erreurs / Exceptions {#core-ref:89f22242-d028-4581-b311-5f6f2f1c7fb4}

N/A

## Historique {#core-ref:e7625520-62af-4824-b6a6-9937e4d10397}

N/A

## Exemples {#core-ref:a1f55038-cbd3-44b3-994e-97e67b5ddd55}

N/A

## Notes {#core-ref:bdbec912-0084-4a0b-8eec-43b88e32e427}

Cette méthode et [`SearchDoc::setStart`][setStart] peuvent être utilisée pour faire des tournes
pages.

## Voir aussi {#core-ref:0e406a72-9e28-41de-b95d-ee14dc822f2a}

N/A

<!-- link -->

[setStart]:        #core-ref:2527bda4-acc9-42ed-99e0-2ecbd6254a8e