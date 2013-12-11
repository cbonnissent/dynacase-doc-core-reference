# SearchDoc::setPertinenceOrder() {#core-ref:287db32e-abb9-4ea3-a692-3dfded873b48}

<div class="short-description">
Par défaut les documents sont triés par titre, il est toutefois possible de 
trier les documents par pertinence, c'est à dire en fonction de son contenu
textuel.
</div>

## Description {#core-ref:bf82aff8-46da-47e5-af0f-1b83bf02cf26}

    [php]
    void setPertinenceOrder()

Le détail du calcul de l'ordre de pertinence est dans le chapitre de 
[recherche avancé][advancedSearchPertinence].

Cette pertinence est évaluée sur l'ensemble des valeurs d'attributs et non sur
un attribut en particulier. 

### Avertissements {#core-ref:f2f1e4a6-1e22-4505-b0a3-1f0aa361dd99}

Attention si vous utilisez des conditions parenthésées, celles-ci doivent être
correctement balancée (toute parenthèse ouvrante doit avoir un parenthèse 
fermante et vice-versa).

Cette recherche ne fonctionne que pour les textes en langue française.

## Liste des paramètres {#core-ref:63488058-47ff-4122-aef1-21c8e046a0f8}

(string) `keyword` (valeur par défaut `""`)
:   Si un [`SearchDoc::addGeneralFilter`][addGeneralFilter] est utilisé, vous
    pouvez juste appeler la fonction sans paramètre alors le choix de la 
    pertinence est celui du filtre. Vous pouvez sinon ajouter une chaîne de 
    caractères pour préciser la recherche la syntaxe est celle de 
    [postgresql][pgServiceTsQuery].

## Valeur de retour {#core-ref:f0a583a4-3e79-4bf0-a8e4-301e0e018465}

Void.

## Erreurs / Exceptions {#core-ref:0dbaa982-bb06-4529-be3f-7d13f1774a27}

Aucune.

## Historique {#core-ref:bba9e4be-d60e-4324-b542-7a4e3662894b}

Aucun.

## Exemples {#core-ref:f2eff102-30be-4438-bb51-ef6579de62a1}

### Mot simple {#core-ref:7beea7bf-35dd-4708-82d3-0042a64b6a8e}

    [php]
    $s=new SearchDoc('',"ANIMAL");
    $s->addGeneralFilter('cheval'); 
    $s->setPertinenceOrder(); // la pertinence est sur le mot cheval
    $s->search();

Dans ce cas, la pertinence est calculé sur les occurences du mot _cheval_.

### Plusieurs mots  {#core-ref:c1365011-1766-4459-80c0-f93edc0c0ce7}

    [php]
    $s=new SearchDoc('',"ANIMAL");
    $s->addGeneralFilter('cheval OR poulain OR jument'); 
    $s->setPertinenceOrder('cheval noir'); // la pertinence est sur le mot cheval et noir
    $s->search();

Dans ce cas, la pertinence est d'autant plus élevé qu'il y les mots "cheval et
noir" qui sont proches.

### Exemple de résultat {#core-ref:6de5692d-ef06-4ba4-84c1-75dbbffca122}

Soit le document suivant :

    Identification
        Nom     (TITRE)  :   Antilope
        Classe  (RESUMÉ) :   Mammalia
        Ordre   (RESUMÉ) :   Artiodactyles
    Caractéristique
        Continents    : Afrique
        Poids         : 25
        Répartition   : Inde au sud de l'Himalaya.
        Alimentation  : Herbivore.
        Reproduction  : Non saisonnière. La femelle donne naissance à 1 petit. 
                        La gestation est de 6 mois.
        Habitat       : Des semi-déserts aux bois clairs
        Comportement  : Harems composés d'1 mâle adulte et de plusieurs femelles: 
                        10 à 20. avec leur jeune. Des groupes de jeunes mâles 
                        vivent à la périphérie des harems.

|         Pertinence        |   Rank  |                     Explication                     |
| ------------------------- | ------- | --------------------------------------------------- |
| antilope artiodactyle     | 0.86484 | Poids conjugués du titre et du résumé et proximité  |
| antilope                  | 0.63832 | Le titre est de poids A                             |
| antilope OR harem         | 0.39515 | = (antilope + harem) / 2                            |
| antilope OR himalaya      | 0.37995 |                                                     |
| antilope OR inde          | 0.37995 |                                                     |
| antilope OR harem OR inde | 0.30396 |                                                     |
| antilope harem inde       | 0.30320 |                                                     |
| antilope inde             | 0.30307 |                                                     |
| artiodactyle              | 0.27357 | Le résumé est de poids B                            |
| bois clair                | 0.19821 | Proximité des 2 mots                                |
| 10 20                     | 0.19700 |                                                     |
| harem                     | 0.15198 | Le mot est présent 2 fois                           |
| himalaya OR harem         | 0.13678 |                                                     |
| himalaya                  | 0.12158 | Texte présent une fois                              |
| inde                      | 0.12158 | Texte présent une fois                              |
| sud                       | 0.12158 | Texte présent une fois                              |
| 5                         | 0.12158 | Nombre présent une fois                             |
| antilope himalaya         | 0.07838 |                                                     |
| bois jeune                | 0.01060 | Mots plus éloignés                                  |
| himalaya harem            | 0.00082 |                                                     |
| antilope clair            | 0.00004 |                                                     |
| antilope harem            | 0.00003 | Mots éloignés (antilope au début et harem à la fin) |



## Notes {#core-ref:55b74001-fdd9-44c5-ad89-4ee336b6048a}

Aucune.

## Voir aussi {#core-ref:9840e104-abde-45c1-a8d6-159559c47058}

Voir chapitre [Recherche avancée][advancedSearchPertinence].

*   [`SearchDoc::addGeneralFilter()`][addGeneralFilter]

<!-- links -->

[advancedSearchPertinence]:     #core-ref:d3f2d069-4e87-4423-97cf-4589ae3be2c7
[addGeneralFilter]:             #core-ref:453cff11-09d9-4607-ab81-7acd36e99750
[pgServiceTsQuery]:             http://www.postgresql.org/docs/9.3/static/datatype-textsearch.html#DATATYPE-TSQUERY "Postgresql : TSQUERY"
