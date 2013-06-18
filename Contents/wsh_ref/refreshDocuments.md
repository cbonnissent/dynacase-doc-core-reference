# refreshDocuments {#core-ref:d42dccaf-2225-4727-b528-b66df42aa358}

## Description {#core-ref:197012f8-98af-4994-8be2-7d96587e4f1d}

Le script `refreshDocuments` permet d'appliquer une méthode sur les documents
d'une famille donnée.

## Usage {#core-ref:fdaf3246-45e0-4521-80b6-732f11f825fc}

**`famid` (obligatoire)**
:   Identifiant, ou nom logique, de la famille des documents sur lesquels
    s'applique le traitement.

`method` (default `refresh`)
:   La méthode à appliquer sur les documents de la famille.
    
    Par défaut c'est la méthode `refresh()` qui est appliquée.

`arg`
:   Permet de spécifier le premier argument de la méthode.

`revision` (default `no`)
:   Permet de spécifier si la méthode doit être appliquée sur toutes les
    révisions des documents (`yes`) ou seulement sur la dernière révision des
    documents (`no`).

`docid`
:   Permet de restreindre le traitement à un seul document dont l'identifiant ou
    le nom logique est spécifié par cette option.

`start`
:   La liste des documents à traiter est ordonnée par ordre décroissant des
    identifiants de document (`id`). Cette option permet de commencer le
    traitement à partir d'un indice de document donné.
    
    Voir [`SearchDoc::setStart()`][searchdoc_setstart]

`slice`
:   Permet de limiter le traitement à un nombre donné de documents.
    
    Dans ce cas, seul les `slice` premiers documents (à partir du document
    désigné par `start`) seront traités.
    
    Voir [`SearchDoc::setSlice()`][searchdoc_setslice]

`fldid`
:   Permet de restreindre le traitement aux documents présents dans un
    répertoire ou retournés par une recherche.
    
    `fdlid` peut donc être l'identifiant ou le nom logique d'un document
    Répertoire (`DIR` ou dérivé) ou d'un document Recherche (`SEARCH` ou
    dérivé).

`filter`
:   Permet de spécifier un filtre SQL additionnel pour la sélection des
    documents sur lesquels est appliqué le traitement.

`save` (default `light`)
:   Permet de spécifier si une méthode de post-traitement doit être appliquée
    pour la sauvegarde des modifications effectuées par la méthode `method`.
    
    Les valeurs possibles sont :
    
    `complete`
    :   Appelle la méthode `store()` après l'exécution de la méthode `method`.
    
    `light`
    :   Appelle la méthode `modify(true)` après l'exécution de la méthode
        `method`.
    
    `none`
    :   N'appelle aucune autre méthode additionnelle après l'exécution de la
        méthode `method`.

## Limite d'usage {#core-ref:e8623a7a-c9e1-4150-950d-3769b7177163}

Seul le premier argument de la méthode `method` peut être spécifié avec l'option
`arg`. Les autres arguments de la méthode ne seront donc pas positionnés (ce qui
peut restreindre les méthodes utilisable par ce traitement).

<!-- links -->
[searchdoc_setstart]: #core-ref:2527bda4-acc9-42ed-99e0-2ecbd6254a8e
[searchdoc_setslice]: #core-ref:298603d5-ee5e-4c61-81b7-51b699dc670e