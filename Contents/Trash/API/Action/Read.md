# Action::Read

<div class=”short-description”>
Récupère une variable dans la session de l'utilisateur.
</div>

<div class=”applicabilite”>
Applicable
</div>



## Description

    [php]
    mixed read(string $k [, mixed $def = ""])

Cette méthode permet de récupérer les valeurs de variables de sessions précédément enregistrées par la méthode `Action::register()`.



### Avertissements

La session utilisateur n'est pas utilisable en mode console.

## Liste des paramètres

(string) `k`
: Nom de la variable de session à lire.

(mixed) `def`
: Valeur retournée si la variable n'a pas été enregistrée précédemment dans la session.<br />
    Valeur par défaut : chaîne vide.


## Valeur de retour

La méthode retourne la valeur de la variable *k*.
Si la variable est non trouvée ou strictement égale à null, la valeur *def* est retournée.

## Erreurs / Exceptions

La session n'est valide que lors d'un accès web. Les sessions ne sont pas utilisables en mode console et dans ce cas cette méthode retourne toujours *def*.

## Historique

N/A

## Exemples

    [php]
    // myaction.php
    function myAction(Action &$action) {
        // Récupère le dernier mot recherché
       $myUserLastSearchKey=$action->read('myLastSearchKey');
       $s=new SearchDoc($action->dbaccess,'MY_FAMILY');
       if ($myUserLastSearchKey) {
         $s->addGeneralFilter($myUserLastSearchKey);
       }
       $s->search();
    }

## Notes

N/A

## Voir aussi

* Voir Action::register()
* Voir Action::unRegister()