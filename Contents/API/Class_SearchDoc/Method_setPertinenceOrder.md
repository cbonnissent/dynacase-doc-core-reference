# SearchDoc::setPertinenceOrder() {#core-ref:287db32e-abb9-4ea3-a692-3dfded873b48}

<div class="short-description">
Par défaut les documents sont triés par titre, il est toutefois possible de 
trier les documents par pertinence, c'est à dire en fonction de son contenu
textuel.
</div>
<!--
<div class="applicability">
Obsolète depuis #.#.#
</div>
-->

## Description {#core-ref:bf82aff8-46da-47e5-af0f-1b83bf02cf26}

    [php]
    void setPertinenceOrder()

Le détail du calcul de l'ordre de pertinence est dans le chapitre de 
[recherche avancé][advancedSearchPertinence].

### Avertissements {#core-ref:f2f1e4a6-1e22-4505-b0a3-1f0aa361dd99}

Attention si vous utilisez des conditions parenthésées, celles-ci doivent être
correctement balancée (toute parenthèse ouvrante doit avoir un parenthèse 
fermante et vice-versa).

De plus, cette recherche ne fonctionne que en langue française.

## Liste des paramètres {#core-ref:63488058-47ff-4122-aef1-21c8e046a0f8}

(string) $keyword (valeur par défaut `""`)
:   Si un [`SearchDoc::addGeneralFilter`][addGeneralFilter] est utilisé, vous
    pouvez juste appeler la fonction sans paramètre alors le choix de la 
    pertinence est celui du filtre. Vous pouvez sinon ajouter une chaîne de 
    caractères pour préciser la recherche la syntaxe est celle de 
    [postgresql][pgServiceTsQuery].

## Valeur de retour {#core-ref:f0a583a4-3e79-4bf0-a8e4-301e0e018465}

N/A

## Erreurs / Exceptions {#core-ref:0dbaa982-bb06-4529-be3f-7d13f1774a27}

N/A

## Historique {#core-ref:bba9e4be-d60e-4324-b542-7a4e3662894b}

N/A

## Exemples {#core-ref:f2eff102-30be-4438-bb51-ef6579de62a1}

Quelques exemples sont disponibles dans le chapitre [recherche avancée][advancedSearchPertinence].

## Notes {#core-ref:55b74001-fdd9-44c5-ad89-4ee336b6048a}

N/A

## Voir aussi {#core-ref:9840e104-abde-45c1-a8d6-159559c47058}

N/A

<!-- links -->

[advancedSearchPertinence]:     #core-ref:d3f2d069-4e87-4423-97cf-4589ae3be2c7
[addGeneralFilter]:             #core-ref:453cff11-09d9-4607-ab81-7acd36e99750
[pgServiceTsQuery]:             http://www.postgresql.org/docs/9.3/static/datatype-textsearch.html#DATATYPE-TSQUERY "Postgresql : TSQUERY"
