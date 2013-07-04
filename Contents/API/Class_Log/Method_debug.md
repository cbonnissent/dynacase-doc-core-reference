# Log::debug() {#core-ref:118a9645-7b2d-4d4f-915e-ffd2ad17e8b5}

<div markdown="1" class="short-description">
La méthode `debug()` journalise un message avec le niveau de log `Log::WARNING`.
</div>

## Description {#core-ref:9a28c56d-b4e2-48d6-a783-ca9f460ee951}

    [php]
    void debug ( string $message )

### Avertissements {#core-ref:5d282f55-19c7-44ea-ac50-98ac3fba1c35}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la
lettre `D` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:3c71dfd6-2da7-4d1c-81ae-9a42c579152e}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:c09a2600-f87f-4ad4-9bb8-927c1f9ae261}

Aucune.

## Erreurs / Exceptions {#core-ref:21908ccd-528f-4a0c-a68d-e9633ba00614}

Aucune.

## Historique {#core-ref:a9fa2a67-3783-4c6c-8d50-57abc38036f7}

Aucun.

## Exemples {#core-ref:b78ba693-3394-4fa0-948c-4e84b9fa981d}

    [php]
    $log = new Log();
    $log->debug("I was here!");

Sortie :

    Jul  3 14:15:92 localhost [D] Dynacase: []  : I was here!

## Notes {#core-ref:46f7dfbe-b518-48aa-91f1-1147724f335c}

Aucune.

## Voir aussi {#core-ref:bd3fbdcb-a9d5-4ea7-93e0-9a2f7c2ebf09}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931