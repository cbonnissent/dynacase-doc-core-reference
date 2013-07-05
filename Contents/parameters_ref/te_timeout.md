# `TE_TIMEOUT` {#core-ref:13234708-8959-4007-8498-49deebf2aae9}

## Description {#core-ref:a3504e4d-a0e9-4e94-a4fd-d69261d81735}

Le paramètre `TE_TIMEOUT` permet de spécifier la durée maximale d'attente lors
de la connexion au serveur de transformation.

Une erreur de connexion est retournée si la connexion n'a pu être établie dans
ce temps imparti.

*   App : `FDL`
*   Portée : Global
*   Valeur initiale : `2`
*   Utilisateur : Non

## Valeur {#core-ref:f5873a9a-c4e5-44c4-be35-5b8234d99901}

La valeur est un réel > 0 indiquant, en secondes, la durée maximale d'attente.

Si aucune valeur n'est spécifiée, la valeur `3` est utilisée.

## Notes {#core-ref:17886389-f996-4860-a4f6-adaf8c92c58d}

Aucune.

<!-- links -->