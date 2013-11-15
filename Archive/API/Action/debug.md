# Action::debug

<div class="short-description">
Envoyer un message dans les journaux d'évènements.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    void debug ( string $msg )

La méthode `debug` de l'objet `Action` permet d'envoyer un message dans les journaux d'évènements de Dynacase avec le niveau "(D)debug".

## Avertissements

N/A

## Liste des paramètres

(string) `msg`
:   Le message à envoyer au journal d'évènements avec le niveau "(D)ebug".

## Valeur de Retour

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $action->debug("i = $i");

## Notes

N/A

## Voir aussi

- `Action::error`
- `Action::fatal`
- `Action::info`
- `Action::warning`
- Classe `Log`
