# refreshGroups {#core-ref:baa4a5f5-91f6-42eb-9c14-89163459c146}

## Description {#core-ref:b15b4802-61d3-460e-bf16-74da373eb22f}

Ce script permet de recalculer les membres et l'adresse mail (concaténation des
adresses mail des membres) des groupes dans le cas ou l'affectation des groupes
a été changée sans passer par l'API (mise à jour par requête SQL par exemple).

L'attribut `grp_isrefreshed` avec la valeur `0` indique un groupe qui n'est pas
à jour. Lorsque le groupe est rafraîchi, l'attribut `grp_isrefreshed` est
positionné à la valeur `1`.

## Usage {#core-ref:324d34ee-84fa-47fb-9333-dedfe7c43023}

`force` (default `no`)
:   `yes` pour forcer le rafraîchissement de tous les groupes (indépendamment de
    la valeur de leur attribut `grp_isrefreshed`).

## Limite d'usage {#core-ref:1d6a824d-1947-4fac-bb60-ebf72cd9335f}

N/A
