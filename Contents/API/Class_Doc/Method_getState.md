# Doc::getState() {#core-ref:09cc14aa-8400-4dd2-a52e-644bb1e30477}

<div class="short-description" markdown="1">

La méthode `getState` permet d'obtenir le nom de l'état du document sur son
[cycle de vie][cycle_de_vie] associé.

</div>

## Description {#core-ref:f755794d-bf3a-4210-9a4b-57e548d947e6}

    [php]
    string getState ( void )

La méthode `getState` retourne le [nom de l'état][wf_cycle] du document si
celui-ci est associé à un [cycle de vie][cycle_de_vie].

### Avertissements {#core-ref:1f26e3ee-8cb6-4c24-9ae1-edaf93e16016}

Aucun.

## Liste des paramètres {#core-ref:42592ce0-d372-4c36-8d23-913a40227d46}

Aucun.

## Valeur de retour {#core-ref:b5c430c3-9317-4067-9c16-ba71e18ac3ef}

La méthode retourne le nom de l'état du document si celui-ci est associé à un
cycle de vie. Si le document ne possède pas de cycle, alors une chaîne vide est
retournée.

## Erreurs / Exceptions {#core-ref:1f0d9524-57e9-47cd-a2db-f5fce604fd0b}

Aucune.

## Historique {#core-ref:579ee02d-23d9-42d5-8658-ec70a07a5a41}

Aucun.

## Exemples {#core-ref:7e59a4ca-16d0-479c-ab7b-72b3050d91e1}

- Exemple #1

Contrôler que la facture est dans l'état Payée (`PAID`) :

    [php]
    $state = $facture->getState();
    if ($state !== 'PAID') {
        throw new Exception(sprintf(
            "La facture '%s' n'est pas dans l'état payée.",
            $facture->getTitle()
        ));
    }

## Notes {#core-ref:52acc84d-c2cf-4051-b4e1-6b9cce9e6bb4}

Cette fonction est un raccourci vers la propriété `state` du document. 
Pour avoir la version affichée dans l'interface de l'état, il suffit de traduire
celui-ci avec la fonction `_`.

## Voir aussi {#core-ref:11fa7419-c82f-4fa6-a542-fb74d0f3d775}

* [getPropertyValue][getPropertyValue]
* [Cycle de vie][cycle_de_vie]

<!-- links -->
[cycle_de_vie]: #core-ref:932119d9-2681-427f-bcf2-2c439784d051
[wf_cycle]: #core-ref:d5ddda0c-09d2-42b0-9543-0723e242ec09
[getPropertyValue]: #core-ref:80e3ca49-26ea-4090-9fcd-7b92bf9d5c6d
