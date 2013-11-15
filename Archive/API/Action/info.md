# Action::info

<div class="short-description">
Envoyer un message dans les journaux d'évènements.
</div>

<!-- <div class="applicability"></div> -->

## Description


    [php]
    void info ( string $msg )

La méthode `info` de l'objet `Action` permet d'envoyer un message dans les journaux d'événements de Dynacase avec le niveau "(I)nfo".

## Avertissements

N/A

## Liste des paramètres

(string) `msg`
:   Le message à envoyer au journal d'événements avec le niveau "(I)nfo"

## Valeur de Retour

La méthode ne retourne pas de valeur.

## Erreurs / Exceptions

N/A

## Historique

N/A

## Exemples

- Exemple #1


    [php]
    $action->info(sprintf("Document with id '%d' has been deleted.", $id));

## Notes

N/A

## Voir aussi

- `Action::debug`
- `Action::error`
- `Action::fatal`
- `Action::warning`
- Classe `Log`
