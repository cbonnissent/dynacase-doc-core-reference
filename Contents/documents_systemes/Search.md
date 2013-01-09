# Recherche simple {#core-ref:64c27570-07bf-4eb8-b970-d2b392716b52}

## Présentation {#core-ref:975be4fd-d6f6-4adc-a5ad-3ba8b17fc9b0}

Le type de recherche le plus simple est implémenté au moyen de la famille
`SEARCH` (implémentée par la classe `DocSearch`).

## Éléments de paramétrage {#core-ref:5bdcde6e-35f8-41c4-8c8d-a7c911f204ec}

Cette famille permet de rechercher les documents en spécifiant :

*   des mots clés
*   une famille
    *   avec ou sans ses sous-familles
*   les révisions dans lesquelles chercher  
    Prenons par exemple un document avec les révisions suivantes :
    
        rev1 → rev2 → rev3 ⇢ revC
    
    Les choix possibles sont :
    
    *courante*
    :   permet de ne rechercher que dans les révisions
        courantes des documents (Ex. : recherche sur *revC*).
    
    *toutes les révisions*
    :   permet de rechercher dans toutes les révisions 
        des documents (Ex. : recherche sur *rev1, rev2, rev3, revC*).
    
    *dernière révision*
    :   permet de ne rechercher que dans les dernières 
        révisions des documents (Ex. : recherche sur *rev3*).
    
    *sans la courante*
    :   permet de rechercher dans toutes les révisions 
        sauf la courante (Ex. : recherche sur *rev1, rev2, rev3*).
    
    *dernière parmi les révisions effectuées*
    :   permet de rechercher dans toutes les révisions 
        (sauf la courante) des documents mais de ne retourner que la 
        dernière des révision des documents qui correspond aux critères 
        (Ex. : recherche sur *rev1, rev2, rev3*, 
        mais ne retourne que *rev3*).
*   une restriction aux documents
    *   modifiables par l'utilisateur
    *   supprimables par l'utilisateur
*   comprenant ou non les documents supprimés
*   une restrictions aux documents contenus dans un dossier donné