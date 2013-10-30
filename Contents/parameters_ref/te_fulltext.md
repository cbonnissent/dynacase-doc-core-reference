# `TE_FULLTEXT` {#core-ref:a762f1dc-136c-40b6-9167-a7d6283d3d77}

## Description {#core-ref:062aaff4-a1bf-42fc-9ca0-06a4bbb177e4}

Le paramètre `TE_FULLTEXT` permet d'activer l'indexation des fichiers par
Dynacase, via l'utilisation du moteur de transformation, lors de la sauvegarde
des documents.

*   App : `FDL`
*   Portée : Global
*   Valeur initiale : `yes`
*   Utilisateur : Non

## Valeur {#core-ref:e90b9683-a24c-4912-bcec-54fb5c35aa82}

La valeur peut être `yes` pour indiquer d'indexer les fichiers des documents, ou
`no` pour ne pas indexer les fichiers des documents.

## Notes {#core-ref:c065f533-2c80-4d3f-9f42-1e878185428e}

L'indexation des fichiers n'est active que si le moteur de transformation est
disponible (c.f. [`TE_ACTIVATE`][te_activate]).

<!-- links -->
[te_activate]: #core-ref:3150c434-24ce-4bd9-8b38-776ef8007ab5