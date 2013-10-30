# `CORE_START_APP` {#core-ref:82f525dd-33a0-4b25-9efb-7fb50f251802}

## Description {#core-ref:829860a5-0308-4b45-a13d-71287d7f0c4f}

Le paramètre `CORE_START_APP` permet de spécifier l'application par défaut qui
est lancée une fois l'utilisateur authentifié sur le système. C'est alors
l'action par défaut de cette application qui est lancée.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `CORE`
*   Utilisateur : Non

## Valeurs {#core-ref:e3ce031e-c964-4d6d-a6bd-9f1a0f7aa0c4}

La valeur du paramètre doit être le nom d'une application Dynacase
(e.g. `CORE`).

## Notes {#core-ref:18210d55-dd07-46d9-b6b4-fa91c9a67b7e}

Il n'est pas possible de rediriger vers une action particulière d'une
application. On ne peut re-diriger que vers l'[action][actionDef] `ROOT`.

<!-- links -->
[actionDef]: #core-ref:e67d8aeb-939c-46e3-9be8-6fc3ba75ebc2