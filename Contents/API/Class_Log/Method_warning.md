# Log::warning() {#core-ref:75225e74-31cd-48cb-9297-a1cc412f1e75}

<div markdown="1" class="short-description">
La méthode `warning()` journalise un message avec le niveau de log
`Log::WARNING`.
</div>

## Description {#core-ref:d3a3a34f-9935-4618-ac7e-ffda5b15b6ae}

    [php]
    void warning ( string $message )

### Avertissements {#core-ref:0c2af6ec-a0a3-4079-b8b1-87bb04bd2dde}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la lettre
`W` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:1df864ef-a880-497c-8892-d6588bb26632}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:8159ca86-e7b6-4b97-833b-b6518574073d}

Aucune.

## Erreurs / Exceptions {#core-ref:61c745e9-7d0c-4434-9b55-96a4f7602196}

Aucune.

## Historique {#core-ref:d9b94942-5327-473f-9558-bc920bcfc16b}

Aucun.

## Exemples {#core-ref:2d92cbbe-d2ff-44c8-948d-5ebd3b39c598}

    [php]
    $log = new Log();
    $log->warning("This is just a warning...");

Sortie :

    Jul  3 14:15:92 localhost [W] Dynacase: []  : This is just a warning...

## Notes {#core-ref:4053265f-60cd-4e0c-844f-67f44fff60c4}

Aucune.

## Voir aussi {#core-ref:b1cb1659-2bf0-4879-9576-6f1fed4052c6}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931