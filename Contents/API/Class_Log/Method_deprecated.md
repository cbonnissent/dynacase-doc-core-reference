# Log::deprecated() {#core-ref:cc9f5e69-0eb8-4ad4-8b5f-374d7587eb35}

<div markdown="1" class="short-description">
La méthode `deprecated()` journalise un message avec le niveau de log
`Log::DEPRECATED`.
</div>

## Description {#core-ref:4be7a531-c420-400a-a912-6f6d325d30fa}

    [php]
    void deprecated ( string $message )

### Avertissements {#core-ref:d58af4dd-8c20-4246-80e6-3a36831aa940}

Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL] doit contenir la lettre
`O` pour que le message soit journalisé.

## Liste des paramètres {#core-ref:b7f549d1-715a-4c83-835c-baa1a76ee992}

(string) `message`
:   Le message à journaliser.

## Valeur de retour {#core-ref:27a25133-9e1b-444f-88a8-85dedddb461f}

Aucune.

## Erreurs / Exceptions {#core-ref:235447b3-b77e-47bb-8acf-90770190603c}

Aucune.

## Historique {#core-ref:2c2652b8-26b9-4b13-9d69-d4d3fd89d636}

Aucun.

## Exemples {#core-ref:77ebf6a0-f384-490d-a6c5-52ca7dedf696}

    [php]
    function foo() {
        bar();
    }
    
    function bar() {
        baz();
    }
    
    function baz() {
        $log = new Log();
        $log->deprecated('Use of baz is deprecated. Please use qux() instead.');
    }
    
    foo();

Sortie :

    Jul  3 10:11:12 localhost [O] Dynacase: []  : Use of baz is deprecated. Please use qux() instead. bar called in foo(), file /…/….php:16


## Notes {#core-ref:0967264e-cf8e-4842-8171-2db2dfbe3919}

Aucune.

## Voir aussi {#core-ref:9ab542f7-d4f3-42ef-bc9a-3252e6ece78c}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931