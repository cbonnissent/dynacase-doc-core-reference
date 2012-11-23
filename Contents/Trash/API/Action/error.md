# Action::error

<div class="short-description">
Envoyer un message dans les journaux d'évènements.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    void error ( string $msg )

La méthode `error` de l'objet `Action` permet d'envoyer un message dans les journaux d'évènements de Dynacase avec le niveau "(E)rreur".

## Avertissements

N/A

## Liste des paramètres

(string) `msg`
:   Le message à envoyer au journal d'évènements avec le niveau "(E)rreur"

## Valeur de Retour

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $action->error(sprintf("Could not find document with id '%d'.", $i));

## Notes

N/A

## Voir aussi

- `Action::debug`
- `Action::fatal`
- `Action::info`
- `Action::warning`
- Classe `Log`
