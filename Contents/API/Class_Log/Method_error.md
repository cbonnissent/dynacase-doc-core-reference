# Log::error() {#core-ref:b88e56b4-0a36-4a02-8f5e-dd72d266c1cd}

<div markdown="1" class="short-description">
La méthode `error()` journalise un message avec le niveau de log `Log::ERROR`.
</div>

## Description {#core-ref:c2e487b3-2b84-488d-a8ea-360a96955c48}

    [php]
    void error ( string $message )

### Avertissements {#core-ref:d5578a19-d43a-4003-b19e-0506088941ff}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la lettre
`E` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:1d6039aa-1c0c-4bc9-a7a2-f3f0f27ea4e1}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:b912b649-f4f7-4213-bf03-f687786db8d8}

Aucune.

## Erreurs / Exceptions {#core-ref:d4efb8f5-48e8-4da0-a9af-76a43bceab43}

Aucune.

## Historique {#core-ref:03f71c18-9188-42de-b850-96ae6552034f}

Aucun.

## Exemples {#core-ref:eba4e6c7-cf93-4bf6-a1cb-474973278578}

    [php]
    $log = new Log();
    $log->error("Oops, something went wrong...");

Sortie :

    Jul  3 14:15:92 localhost [E] Dynacase: []  : Oops, something went wrong...

## Notes {#core-ref:913911f1-caf1-4fa4-aeec-53a19501bef5}

Aucune.

## Voir aussi {#core-ref:a87ec860-3b63-48a3-9b3b-11bb9fba136a}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931