# Log::info() {#core-ref:1029172b-29eb-46cd-a2ff-6c1501320e5b}

<div markdown="1" class="short-description">
La méthode `info()` journalise un message avec le niveau de log `Log::INFO`.
</div>

## Description {#core-ref:23bff0c2-cede-4bca-95ba-b7c3c466d3f6}

    [php]
    void info ( string $message )

## Avertissements {#core-ref:2e2bdbe2-a4af-4830-814f-86372345f052}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la lettre
`I` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:c314fd7f-ca20-461e-8621-d8448f9f903f}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:ba309b32-0e72-42b0-a30a-50eb0e58163d}

Aucune.

## Erreurs / Exceptions {#core-ref:3cd34132-9e11-4021-b3c4-782173ed94a4}

Aucune.

## Historique {#core-ref:21f85be4-b7d6-4580-9872-4be5529ec073}

Aucun.

## Exemples {#core-ref:b2b1422d-572b-4d39-aea4-6235b53f078d}

    [php]
    $log = new Log();
    $log->info("lp0 on fire");

Sortie :

    Jul  3 14:15:92 localhost [I] Dynacase: []  : lp0 on fire

## Notes {#core-ref:45cb2273-a6b7-4699-81b9-141059063c06}

Aucune.

## Voir aussi {#core-ref:ad7ed323-a2fa-454b-88e6-9fb3345d9f84}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931