# initializeDocrelTable {#core-ref:6c3ef616-21e4-4e47-bb80-c1556c016f10}

## Description {#core-ref:f844c159-3150-4858-82bb-9033914a5e9d}

Les relations entre documents sont stockées dans un cache, la table `docrel`.

Le script `initializeDocrelTable` permet de régénérer ce cache.

## Usage {#core-ref:111b371e-ad18-4c19-b0c2-019d75fe9d75}

`dryrun` 
:   Permet d'afficher les requêtes SQL sans les exécuter et donc sans
    modifier quoi que ce soit.

`famid` (default `all`)
:   Permet de spécifier l'identifiant, ou le nom logique, d'une famille pour
    restreindre le traitement aux relations de cette seule famille.
    
    Par défaut, le traitement s'applique à toutes les familles (`all`).

`transaction` 
:   Permet d'indiquer d'effectuer les modifications dans une transaction
    
    Si l'on utilise une transaction et qu'une des sous-opérations génère une
    erreur, alors aucune des modifications n'est appliquée.

`softclean`  
:   Indique que la table `docrel` ne sera pas supprimée avant sa reconstruction.
    La table `docrel` est mise à jour au fur et à mesure 
    du traitement des familles.  
    Dans le cas contraire, la table `docrel` est
    supprimée avant d'être intégralement reconstituée.
    
    Cette option sera systématiquement activée si une famille est spécifiée
    via l'option `famid`.

## Limite d'usage {#core-ref:4692046f-08ff-408e-93c4-c4564c6d7e95}

N/A
