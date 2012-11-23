# Action::execute

<div class="short-description">
Exécuter une action.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    string execute ()

La méthode `execute` de l'objet `Action` permet de lancer l'exécution du code correspondant à l'objet `Action` et de retourner la vue résultante sous la forme d'une chaîne de caractères.

## Avertissements

N/A

## Liste des paramètres

La méthode ne prend pas paramètres.

## Valeur de Retour

Retourne une chaîne de caractère contenant le résultat de la composition de la vue de l'object `Action` exécuté, ou une chaîne de caractère vide si l'objet `Action` est mal configuré.

## Erreurs / Exceptions

- La méthode `execute` retourne une chaîne vide dans le cas d'une erreur de configuration de l'objet `Action`.
- La méthode `execute` lève une Exception `Dcp\\Exception` avec un message d'erreur `CORE0006` lorsque l'utilisateur connecté n'a pas le droit d'exécuter l'action.
- La méthode `execute` laisse remonter toute autre exception levée par le contrôleur de l'action.

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $output = '';
    try {
        $core = null;

        $application = new Application();
        $application->Set('MY_APP', $core);

        $action = new Action();
        $action->Set('MY_ACTION', $application);

        $output = $action->execute();
    } catch(Exception $e) {
        [...]
    }
        
    if ($output == '') {
        [...]
    } else {
        print $output;
    }

## Notes

N/A

## Voir aussi

N/A
