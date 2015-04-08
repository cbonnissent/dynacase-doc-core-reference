# `CORE_SESSIONGCPROBABILITY`   {#core-ref:143e8a1d-7c75-4707-bcf2-8a96847bb58e}

## Description   {#core-ref:5cf313f0-0f9e-463b-840f-a9d3aaee6824}

Probabilité de déclenchement du nettoyage des sessions non utilisée.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `0.01`
*   Utilisateur : Non

Le "garbage collector" de session est vérifié à chaque requête avec la
probabilité indiquée.

Si la valeur est 0.01, il y a une chance sur 100 de déclencher le nettoyage.
En moyenne, toutes les 100 requêtes, un nettoyage est effectué.

## Valeur   {#core-ref:04b03343-ad47-46f7-962c-e2b95d962ad2}

La valeur est un nombre compris entre 0 et 1.
Si la valeur est zéro, le déclenchement n'est jamais exécuté.
Si la valeur est un, le déclenchement est exécuté à chaque requête.


## Notes   {#core-ref:9918107b-784d-430d-aa76-e4e25d743577}

Voir aussi [`CORE_SESSIONMAXAGE`][sessionmaxage]

<!-- links -->
[sessionmaxage]: #core-ref:07bc6ece-f937-4c8b-8627-d39f9999f086
