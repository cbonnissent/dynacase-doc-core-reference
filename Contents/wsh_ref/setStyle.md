# setStyle {#core-ref:a2898d77-9f34-4b4c-ab50-9fb3cad6f140}

## Description {#core-ref:abc3a38b-3695-43f3-96c8-0a5f580d1d49}

Le script `setStyle` permet de changer le style appliqué à Platform ou
d'actualiser le style actuellement utilisé.

## Usage {#core-ref:ab1bd603-90f1-4f39-be71-7e065f01fb56}

`style`
:   Chemin d'accès vers un fichier `.sty` contenant la description du style à
    utiliser ou nom du style dans le sous-répertoire `STYLE`
    (`STYLE/%s/%s.sty`).
    
    Si `style` n'est pas spécifié, alors le style actuellement utilisé est
    actualisé.
    
    Voir [gestion des styles][style_management].

`verbose` (default `no`)
:   Permet d'indiquer au script d'afficher plus de messages (`yes`) durant son
    exécution, ou d'afficher moins de messages (`no`).

## Limite d'usage {#core-ref:efb009ba-6632-449d-abdb-73bfed9e7a7b}

N/A

<!-- links -->
[style_management]: #core-ref:1844a1a8-1406-47bd-a884-1a18ef0a6ca7