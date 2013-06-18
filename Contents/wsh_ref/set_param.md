# set_param {#core-ref:75bd5f66-ad6b-470b-b217-7e926d7f960e}

## Description {#core-ref:baffb5e2-2bd5-4952-93ad-0d08e24883dc}

Le script `set_param` permet de changer la valeur d'un paramètre applicatif.

## Usage {#core-ref:468354ee-e36a-487c-bc1c-6304a7cbf2a1}

**`param` (obligatoire)**
:   Nom du paramètre dont la valeur doit être changée.

`value`
:   Nouvelle valeur à affecter au paramètre.

`appname`
:   Permet de spécifier le nom d'une application pour restreindre la recherche
    aux seuls paramètres de cette application.

## Limite d'usage {#core-ref:ca5956d4-7dc8-4403-b8db-036599879a6e}

Si `appname` n'est pas précisé et que `param` se trouve dans plusieurs
applications, un message d'erreur est retourné, demandant de préciser le nom de
l'application.

Si aucun paramètre de ce nom n'est trouvé, un message d'erreur est retourné.

Dans tous les autres cas, la valeur du paramètre sera changée.

Si aucune valeur n'est précisée, alors la valeur du paramètre sera `NULL`.
