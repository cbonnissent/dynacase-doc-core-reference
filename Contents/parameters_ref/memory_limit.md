# `MEMORY_LIMIT` {#core-ref:1b7e7d58-e7e4-445d-8b26-ab42d7184165}

## Description {#core-ref:a8c8f7ff-f110-40ab-867c-d32361daafd7}

Le paramètre `MEMORY_LIMIT` permet de paramétrer la mémoire maximum qu'une
requête Dynacase est autorisée à allouer.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `64`
*   Utilisateur : Non

## Valeur {#core-ref:2eedf277-3496-40da-a3d3-939a8780e872}

La valeur du paramètre `MEMORY_LIMIT` est exprimée par un entier (pour une
quantité exprimée en méga-octets) ou un entier suivi du suffixe `G` (pour une
quantité exprimée en giga-octets).

Exemple de valeurs :

* `128` : pour 128 Mo
* `1G` : pour 1 Go

## Notes {#core-ref:2f79011d-6600-404e-aca2-711dab65d622}

Les [scripts d'API][wsh_ref], lancée par [`wsh.php`][wsh_cli], ne sont pas
soumis à cette limite, et leur utilisation mémoire est non-limitée.

<!-- links -->
[wsh_ref]: #core-ref:65862835-f70c-4cd5-bc3b-88f61d49c87a
[wsh_cli]: #core-ref:1566c46d-a53d-44cf-8c3f-0d0e21c0b117