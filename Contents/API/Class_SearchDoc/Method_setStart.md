# SearchDoc::setStart() {#core-ref:2527bda4-acc9-42ed-99e0-2ecbd6254a8e}

<div class="short-description">
Cette méthode permet de définir que la récupération des documents commence après
le nième trouvé.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:2866f217-4879-4d63-aed9-f166e3a712f6}

    [php]
    bool setStart ( $start )

Cette méthode permet de définir que les documents avant le `$start` sont ignorés
, par exemple en admettant que l'on ait 11 animaux et que l'on recherche tous
les animaux en mettant le $start à 10 alors on trouve 1 animal

### Avertissements {#core-ref:9e08e2a3-2399-420d-83d9-61d4e682a7ca}

Aucun.

## Liste des paramètres {#core-ref:e1aafca1-122e-4550-9bc4-fd3d717e7dc5}

(int) $start
:   Définit le nième document après lequel la recherche commence.

## Valeur de retour {#core-ref:fac86141-057c-47b2-bb14-1d1ac78cc785}

bool : `true` si le paramètre a été appliqué, `false` sinon.

## Erreurs / Exceptions {#core-ref:c8271f9f-6461-46da-b55e-22b41b963678}

Si jamais `$start` n'est pas `int` alors le paramètre n'est pas appliqué et la
méthode retourne `false`.

## Historique {#core-ref:03f0fb4e-06d3-4e4c-88e5-911815179ea7}

Aucun.

## Exemples {#core-ref:c8cd4b9c-1837-47bd-b741-f27776c981b7}

Aucun.

## Notes {#core-ref:3eebb80c-a85c-41ab-9de8-85bd6a5695c2}

Aucun.

## Voir aussi {#core-ref:936a27f3-e6f6-4fa0-acd0-0d0d35d56209}

Aucun.
