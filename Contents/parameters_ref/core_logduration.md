# `CORE_LOGDURATION`  {#core-ref:0cebb954-7127-42bb-88df-28767a141f6a}

## Description  {#core-ref:71a765c5-b5f9-453b-a760-4a8576c7627c}

Indique le durée de conservation des [logs document][doclog].

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `30` (30 jours)
*   Utilisateur : Non

La suppression des logs document est effectué par le script
[`cleanContext`][wsh_cleanContext] qui est lancé toutes les nuits.

## Valeur  {#core-ref:e4cc44c8-7c5a-4687-8b7a-9785cd52907f}

La valeur est un nombre indiquant la durée de conservation en jours.

## Notes  {#core-ref:0bba4ed0-5fab-452d-9202-0a283df9e65e}

Aucune.

<!-- links -->

[wsh_cleanContext]: #core-ref:100b123b-da1a-45b4-848b-0622f3e09a40
[doclog]:           #core-ref:9090c9ee-fb9c-4cca-b9d6-962052ed69a9