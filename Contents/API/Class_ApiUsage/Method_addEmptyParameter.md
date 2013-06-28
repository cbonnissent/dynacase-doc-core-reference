# ApiUsage::addEmptyParameter() {#core-ref:be7a212d-7e39-4c06-999c-3f76bea3140c}

<div class="short-description">
Ajoute un paramètre qui ne prend pas de valeur (flag).
</div>

## Description {#core-ref:130e7615-09b2-49b8-8ec1-66aba637d08f}

    [php]
    mixed addEmptyParameter ( string $argName [, string $argDefinition] )

### Avertissements {#core-ref:999cc856-618b-4795-84de-deebed7505d8}

N/A

## Liste des paramètres {#core-ref:ec93c26c-08df-43f3-89db-a9b34c46c1cf}

(string) `argName`
:   Le nom du paramètre.

(string) `argDefinition`
:   Un texte (simple ligne) de description du paramètre.

## Valeur de retour {#core-ref:c8c25a44-5baf-4140-9086-6852fe2fc3dd}

Si le paramètre est présent dans les arguments, alors une chaîne vide est
retournée, sinon `false` est retourné.

## Erreurs / Exceptions {#core-ref:bc3ebeb7-1e25-4dbc-8b28-6e948ddbc35c}

N/A

## Historique {#core-ref:61658bde-3384-4bf8-a8fc-3adfe0c98d72}

*   Remplace la méthode `addEmpty()` qui est dépréciée depuis la version 3.2.5.

## Exemples {#core-ref:2926a0c9-4a10-496e-b69e-6e5c4dbb2a97}

    [php]
    $usage = new ApiUsage();
    $debug = $usage->addEmptyParameter("debug", "Turn on debug messages.");
    $usage->verify();
    
    $debug = ($debug === false) ? false : true;
    
    if ($debug) {
        printf("Debug mode ON\n");
    } else {
        printf("Debug mode OFF\n");
    }

&nbsp;

    $ ./wsh.php --api=sampleApi
    Debug mode OFF

Le paramètre n'est pas présent.

    $ ./wsh.php --api=sampleApi --debug
    Debug mode ON

Le paramètre est présent.

## Notes {#core-ref:735ef18f-56f1-47f9-9609-14aefe90720c}

N/A

## Voir aussi {#core-ref:8f648fc5-fce0-4a1d-a363-1cef037c3438}

*   [`apiUsage::verify()`][apiUsage_verify]

<!-- links -->
[apiUsage_verify]: #core-ref:26496476-30f7-4e64-979a-fb019d762b7b
