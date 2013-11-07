# Les recherches {#core-ref:ac74e54a-2c30-4a9c-86e4-bfcca15a6358}

## Présentation {#core-ref:286e9f9e-4d5e-4f4f-b09d-2a7b4ebaf330}

Il est possible de définir des recherches et de les sauvegarder
pour les réutiliser. Ce qui est sauvegardé au moyen d'une recherche,
ce sont les critères et non pas les résultats. 

Une recherche est donc une *collection dynamique* de documents.

## Exemples d'utilisation {#core-ref:0e8cf313-693f-41fc-bead-996e9e299001}

### Paramétrage de l'interface *une famille* {#core-ref:e642a9df-8434-45a2-b8d0-95245fcec401}

Dans l'interface [*une famille*][ONEFAM], il est possible de proposer 
des recherches pré-cablées pour les utilisateurs : ces recherches doivent
être : 

*   visibles par les utilisateurs concernés,
*   dans le dossier système (cf DFLDID dans les 
    [propriétés des familles][family_properties]
    de la famille concernée).


### Backend d'approvisionnement pour des interfaces spécifiques {#core-ref:4871bf7b-02b0-408a-b1e1-585ae3554921}

Soit la demande suivante :

*   une représentation des documents sous forme de grille,
*   que cette grille puisse représenter
    *   Les documents créés cette semaine,
    *   Les documents créés par l'utilisateur courant,
    *   D'autres modalités qu'il définira plus tard au fur et à mesure 
        de ses besoins.

L'IHM à construire peut se définir ainsi :

*   une combobox permettant de choisir une recherche parmi toutes les recherches
    disponibles dans un dossier prédéfini
*   une grille asservie à cette combobox :
    *   dès qu'une recherche est choisie dans la combobox, la grille est
        rechargée avec la recherche sélectionnée comme source de données.

Nous pouvons ensuite créer les recherches correspondant aux demandes spécifiques :

*   Les documents créés cette semaine,
*   Les documents créés par l'utilisateur courant.

Lorsque le client voudra ajouter des modalités de recherche, il lui suffira
de créer des recherches dans le dossier correspondant.

<!-- links -->
[ONEFAM]: https://docs.anakeen.com/dynacase/3.2/dynacase-doc-onefam-reference/website/book/index.html "Documentation de Onefam"
[family_properties]: #core-ref:6f013eb8-33c7-11e2-be43-373b9514dea3