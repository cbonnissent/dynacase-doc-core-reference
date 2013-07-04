# Log::fatal() {#core-ref:11b677a6-a015-4c13-9aa0-0f9cb209690c}

<div markdown="1" class="short-description">
La méthode `fatal()` journalise un message avec le niveau de log `Log::FATAL`.
</div>

## Description {#core-ref:7438c7e8-fbbb-4b77-8ffa-87f508902fff}

    [php]
    void fatal ( string $message )

### Avertissements {#core-ref:baec1c77-dd92-4058-9ea8-f9535b0fb0e2}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la lettre
`F` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:12057902-54af-4be4-ba06-800aec9b45b1}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:1992d0dd-9c13-45fc-89a0-035bd147b413}

Aucune.

## Erreurs / Exceptions {#core-ref:0216f757-e89b-4b39-b1ae-297ededa0b40}

Aucune.

## Historique {#core-ref:641c74b4-f447-4910-88ed-ca592d85b2d7}

Aucun.

## Exemples {#core-ref:72650d01-47c8-4ea2-8057-e0d430c8e15d}

    [php]
    $log = new Log();
    $log->fatal("STOP: 0x00000019 (0x00000000, 0xC00E0FF0, 0xFFFFEFD4, 0xC0000000) BAD_POOL_HEADER");

Sortie :

    Jul  3 14:15:92 localhost [D] Dynacase: []  : STOP: 0x00000019 (0x00000000, 0xC00E0FF0, 0xFFFFEFD4, 0xC0000000) BAD_POOL_HEADER

## Notes {#core-ref:2a85eff5-7fd8-4f5d-8954-addbffa4e6c1}

Aucune.

## Voir aussi {#core-ref:374b66fc-177b-4ffc-8c33-519a55b678fa}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931