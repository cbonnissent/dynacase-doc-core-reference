# getApplicationParameter {#core-ref:113ecafb-1fa0-496d-8d39-810204b52291}

## Description {#core-ref:d666fd71-c191-463b-baed-135d407f57fc}

Le script `getApplicationParameter` permet de récupérer la valeur d'un
paramètre.

## Usage {#core-ref:d2486cc3-67ff-4896-b024-288603b76766}

**`param` (obligatoire)**
:   Nom du paramètre dont la valeur doit être retournée.

## Limite d'usage {#core-ref:12b6b377-efdc-4e3c-a829-058d3530debe}

Ne permet de récupérer que les paramètres de type global ou les paramètres de
l'application `CORE`.

Si le paramètre n'existe pas, n'est pas un paramètre de `CORE` ou n'est pas un
paramètre global, alors une chaîne vide est renvoyée et un message d'erreur est
enregistré.
