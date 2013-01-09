# Rapport {#core-ref:4d6429f1-b3ae-46c4-8687-1c8d29f92f37}

## Présentation {#core-ref:838c4a66-b834-425e-911b-6081961a9c74}

Le rapport permet d'ajouter des options de mise en forme à une
recherche détaillée.

Ainsi, il est possible d'exprimer les critères de
recherche de la même manière que dans une recherche détaillée, et 
de choisir parmi les attributs et propriétés de la familles quelles sont celles
qui seront présentées.

Le résultat est alors affiché sous la forme d'une table,
qui peut ensuite être exportée au format csv.

Il est implémenté au moyen de la famille `Report`, qui étend la famille
`DSEARCH` et y ajoute les méthodes du fichier `Method.Report.php`.

## Éléments de paramétrage {#core-ref:2abe6cc5-a45e-4574-86de-44d80fba2406}

Un rapport dispose, en plus des 
[éléments de paramétrage de la recherche détaillée][detailed_search_param]
des éléments de présentation suivants :

*   un texte de description qui sera présenté sur la page de résultat,

*   l'attribut en fonction duquel seront ordonnés les résultats dans le tableau,

*   une limite au nombre de résultats présentés.
    Lorsque le nombre d'éléments est supérieur à cette limite, 
    alors la liste de résultats sera tronquée 
    et seul les N premiers éléments seront présentés, <span class="fixme MCO">valeur par défaut?</span>

*   les colonnes du tableau de résultat.
    
    Chaque ligne du tableau "Colonnes" permet de sélectionner un attribut 
    ou une propriété du document qui sera présenté sous forme de colonne dans 
    le tableau des résultats.
    
    Pour chaque colonne, il est possible d'indiquer :
    
    *   l'attribut du document à l'aide du sélecteur "label"
    
    *   la couleur de la colonne
    
    *   une opération sur la colonne dont le résultat est présenté en pied de tableau.
        
        Les opérations de pied de tableau disponibles sont :
        
        Somme
        :   effectue la somme des éléments de la colonne
            (attention : le calcul de la somme ne sera correct 
            que pour des valeurs numériques).
        
        Moyenne
        :   effectue la moyenne des éléments de la colonne
            (attention : le calcul de la moyenne ne sera correct
            que pour des valeurs numériques).
        
        Cardinal
        :   effectue un décompte du nombre de lignes dans la colonne.

De plus, il est possible d'exporter le résultat d'un rapport en csv
via un assistant d'export.

## Assistant d'export csv

<span class="fixme MCO"></span>

<!-- links -->
[detailed_search_param]: #core-ref:de8a1440-fb42-4ad0-b041-5c762b5258d9
