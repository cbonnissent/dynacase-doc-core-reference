# Action::hasPermission

<div class="short-description">
Vérifier une permission pour l'utilisateur.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    bool hasPermission ( [ string $acl_name = "" [, string $app_name = "" [, bool $strict = false ]]] )

La méthode `hasPermission` de l'objet `Action` permet de vérifier si l'utilisateur connecté possède une ACL donnée.

## Avertissements

N/A

## Liste des paramètres

(string) `acl_name`
:   Le nom de l'ACL dont on cherche à savoir si l'utilisateur a le droit.

(string) `app_name`
:   Le nom de l'application de l'ACL.
    
    Par défaut, `app_name` est positionné avec l'application de l'objet `Action`.

(bool) `strict`
:   Si l'argument `strict` est positionné à `true` alors la vérification du droit ne prend pas en compte le mécanisme de délégation des droits pour évaluer si l'utilisateur a ou non le droit demandé.
    
    Par défaut, le mécanisme de délégation est pris en compte pour évaluer la permission.

## Valeur de Retour

La méthode `hasPermission` retourne `true` si l'utilisateur a le droit de l'ACL demandée, ou `false` si l'utilisateur n'a pas le droit de l'ACL demandée ou en cas d'erreur dans le calcul (`acl_name` ou `app_name` non existant par exemple).

Si `acl_name` est vide ou non renseigné, alors la méthode retourne `true`.

## Erreurs / Exceptions

En cas d'erreur, la valeur `false` est retournée, indiquant que l'utilisateur n'a pas le droit de l'ACL demandée.

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    if ($action->hasPermission('ACL_X', 'MY_APP')) {
        /*
         * User has ACL_X
         */
        [...]
    } else {
        /*
         * User has no ACL_X
         */
        [...]
    }

## Notes

N/A

## Voir aussi

N/A

