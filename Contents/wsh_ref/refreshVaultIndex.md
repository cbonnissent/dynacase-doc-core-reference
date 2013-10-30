# refreshVaultIndex {#core-ref:17575c41-0b44-4164-8876-c08f4c2c3eb3}

## Description {#core-ref:38a15067-4c07-40bb-b67a-63982e0eb044}

Les associations entre les documents et les fichiers qu'ils référencent sont
stockées dans un cache, la table `docvaultindex`.

Le script `refreshVaultIndex` permet de régénérer ce cache.

## Usage {#core-ref:5763b9de-1405-4788-a246-ce902dbbe4d0}

`dryrun` 
:   Permet d'afficher les requêtes SQL sans les exécuter et donc
    sans modifier quoi que ce soit.

`famid` (default `all`)
:   Permet de spécifier l'identifiant, ou le nom logique, d'une famille pour
    restreindre le traitement aux fichiers de cette seule famille.
    
    Par défaut, le traitement s'applique à toutes les familles (`all`).

`transaction` 
:   Permet d'indiquer que les modifications sont effectuées dans une transaction.
    Par défaut, aucune transaction n'est utilisée.
    
    Si l'on utilise une transaction et qu'une des sous-opérations génère une
    erreur, alors aucune des modifications n'est appliquée.

`softclean` 
:   Ne supprime pas tous les index au préalable.
    Par défaut la table `docvaultindex` est totalement vidée avant d'être 
    reconstruite.
    
    Cette option est systématiquement activée si une famille est spécifiée
    via l'option `famid`.

## Limite d'usage {#core-ref:7220d4f8-e649-40d5-bd9e-04184dda2211}

N/A
