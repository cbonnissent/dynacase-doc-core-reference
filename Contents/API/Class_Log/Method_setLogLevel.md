# Log::setLogLevel() {#core-ref:c654a501-5cfa-4951-a5b0-8e7be4741fa0}

<span class="flag from release">3.2.18</span>

<div markdown="1" class="short-description">
La méthode `setLogLevel()` permet de spécifier le filtre des messages à
journaliser.
</div>

## Description {#core-ref:69cd62af-a42b-493a-99b3-aeda17d173c2}

    [php]
    void setLogLevel ( string $logLevel )

### Avertissements {#core-ref:4da05113-3781-497f-9f57-65182f094d64}

Aucun.

## Liste des paramètres {#core-ref:dc7cb451-42ee-4629-8ce3-c3dad9a83421}

(string) `logLevel`
:   Une chaîne contenant la liste des codes des message à journaliser (voir
    [classe `Log`][log]).

## Valeur de retour {#core-ref:8c867e10-fd13-44cd-95c9-f4a695b294e3}

Aucune.

## Erreurs / Exceptions {#core-ref:b5eeedc3-cea7-49d6-a4e7-676473bdf6f7}

Aucune.

## Historique {#core-ref:508a68d0-77d6-4865-a0b3-5d5189e3f5d4}

Aucun.

## Exemples {#core-ref:72678da8-53e8-49fb-adc6-237cd3c7479f}

    [php]
    $log = new Log();
    /* Ne logger que les messages de debug */
    $log->setLogLevel("D");
    $log->info("You won't see me!");
    $log->debug("I was here!");

Sortie :

    Jul  3 14:15:92 localhost [D] Dynacase: []  : I was here!

## Notes {#core-ref:334bd8a5-1ab2-4bc3-9959-871a6f8128a1}

Aucune.

## Voir aussi {#core-ref:fd07ae7c-ac3d-46c6-96b0-27ecccad15c1}

-   La [classe `Log`][log]
-   Le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[log]: #core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931
