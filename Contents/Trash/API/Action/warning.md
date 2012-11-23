# Action::warning

<div class="short-description">
Envoyer un message dans les journaux d'évènements.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    void warning ( string $msg )

La méthode `warning` de l'objet `Action` permet d'envoyer un message dans les journaux d'évènements de Dynacase avec le niveau "(W)arning".

## Avertissements

N/A

## Liste des paramêtres

(string) `msg`
:   Le message à envoyer au journal d'évènements avec le niveau "(W)arning".

## Valeur de Retour

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $action->warning(sprintf("Attribute '%s' is not empty.", $attrName));

## Notes

N/A

## Voir aussi

- `Action::debug`
- `Action::error`
- `Action::fatal`
- `Action::info`
- Classe `Log`
