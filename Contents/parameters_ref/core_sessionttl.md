# `CORE_SESSIONTTL` {#core-ref:f8ec257f-45f7-4fee-b37b-9ea251b70e3b}

## Description {#core-ref:06db703a-7a79-4607-a979-f5200bd1576d}

Le paramètre `CORE_SESSIONTTL` permet de spécifier la durée de vie des sessions
sur le navigateur de l'utilisateur.

*   App : `CORE`
*   Portée : Global
*   Valeur initiale : `0`
*   Utilisateur : Non

## Valeur {#core-ref:21ef0dc6-16ab-4822-90c8-a6fd6203c67a}

La valeur est un entier >= 0 qui exprime la durée de vie de la session en
secondes.

Si la valeur est égale à 0 (valeur par défaut), alors les sessions seront
valides jusqu'à la fermeture du navigateur par l'utilisateur.

Exemple de valeurs :

* `86400` : durée de vie de 24 heures
* `0`     : durée de vie jusqu'à la fermeture du navigateur

## Notes {#core-ref:434bac90-5578-4f3c-9d50-4a2a4854cec1}

Aucune.

<!-- links -->