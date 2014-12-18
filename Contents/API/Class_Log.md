# Classe Log {#core-ref:2b8f4534-e749-46ba-b69e-afaa470c4b5c}

<div markdown="1" class="short-description">
La classe `Log` permet d'envoyer des messages dans un journal d'événements
([`syslog`][syslog] ou fichier spécifique).
</div>

Chaque message comporte un niveau de log, et le [paramètre applicatif
`CORE_LOGLEVEL`][CORE_LOGLEVEL] (ou la méthode
[`Log::setLogLevel()`][Log::setLogLevel]) permet de filtrer quels messages
seront journalisés par rapport à ce niveau de log.

Table de correspondance entre le niveau de log et le code de niveau de log :

| Niveau de log    | Code de niveau de log |
| ---------------- | :-------------------: |
| Log::CALLSTACK   | C                     |
| Log::DEBUG       | D                     |
| Log::DEPRECATED  | O                     |
| Log::ERROR       | E                     |
| Log::FATAL       | F                     |
| Log::INFO        | I                     |
| Log::TRACE       | T                     |
| Log::WARNING     | W                     |

La valeur par défaut du filtre de messages de la classe `Log` est spécifiée par
le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL].

La valeur du filtre de messages peut ensuite être modifiée avec la méthode
[`Log::setLogLevel()`][Log::setLogLevel].

La valeur par défaut du [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]
étant `IWE`, seuls les messages émis avec les niveaux de log `Log::INFO`,
`Log::WARNING` et `Log::ERROR` seront journalisés.

Pour journaliser tous les messages, il faut positionner `CORE_LOGLEVEL` (ou
faire un appel à [`Log::setLogLevel()`][Log::setLogLevel]) avec la valeur
`CDOEFITW` (liste de tous les codes existants).

## Constructeur {#core-ref:e15afe8c-a00b-4a65-9c05-8d3852ee7179}

    [php]
    new Log ( string $logfile = "",
              string $application = "",
              string $function = "" )

### Avertissements {#core-ref:f7711627-79e2-48f2-8991-ac7bf6259ccd}

Si plusieurs requêtes concurrentes utilisent le même fichier de journal
`logfile`, alors l'ordre et l'intégrité d'écriture des messages ne sont pas
garantis.

Pour garantir l'ordre et l'intégrité d'écriture des messages par des requêtes
concurrentes, il faut alors utiliser le journal [`syslog`][syslog] en spécifiant
une chaîne vide pour `logfile`.

### Liste des paramètres {#core-ref:8c671556-b18a-4d0b-a3dd-4985852061c6}

(string) `logfile`
:   Si `logfile` est vide, alors les messages sont envoyés au journal
    d'événement système par [`syslog`][syslog]. Sinon, les messages sont
    ajoutés au fichier référencé par `logfile` (chemin absolu ou relatif au
    répertoire courant).

(string) `application`
:   Le nom de l'application qui génère le message.

(string) `function`
:   Le nom de la fonction qui génère le message.

### Exemples {#core-ref:dd885b47-de57-4cf1-b92f-14497bd58dcd}

    [php]
    function foo($id) {
        /* Log to syslog */
        $log = new Log('', 'Sample', 'Test');
        /* Log debug message if CORE_LOGLEVEL contains 'D' */
        $log->debug(sprintf("id = '%s'", $id));
    }

Sortie :

    Jul  3 14:15:92 localhost [D] Dynacase:Sample:Test: []  : id = '123'

### Notes {#core-ref:7c0460e9-0f1c-4db5-9f54-6e1489bacfc4}

Si le fichier `logfile` n'est pas spécifié, alors les messages vont dans le
journal système [`syslog`][syslog].

Les noms `application` et `function` sont utilisés pour composer un préfixe qui
est placé devant chaque message émis par l'objet `Log` (voir exemple ci-dessus
et dans la documentation des méthodes).

### Voir aussi {#core-ref:5eb86445-fbee-4095-9992-342e90975e93}

-   le [paramètre applicatif `CORE_LOGLEVEL`][CORE_LOGLEVEL]

<!-- links -->
[syslog]: http://en.wikipedia.org/wiki/Syslog
[CORE_LOGLEVEL]: #core-ref:c579e530-ebfd-442b-9c25-886f19507931
[Log::setLogLevel]: #core-ref:c654a501-5cfa-4951-a5b0-8e7be4741fa0
