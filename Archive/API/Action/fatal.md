# Action::fatal

<div class="short-description">
Envoyer un message dans les journaux d'évènements.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    void fatal ( string $msg )

La méthode `fatal` de l'objet `Action` permet d'envoyer un message dans les journaux d'événements de Dynacase avec le niveau "(F)atal".

## Avertissements

N/A

## Liste des paramètres

(string) `msg`
:   Le message à envoyer au journal d'événements avec le niveau "(F)atal".

## Valeur de Retour

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $action->fatal("Error creating temporary file.");

## Notes

N/A

## Voir aussi

- `Action::debug`
- `Action::error`
- `Action::info`
- `Action::warning`
- Classe `Log`
