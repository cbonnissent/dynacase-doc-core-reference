# ActionUsage::getUsage() {#core-ref:89402bb0-67c0-4ea3-b973-c6ac083933cf}

<div class="short-description">
Retourne le texte d'aide d'usage.
</div>

## Description {#core-ref:67e23572-8e23-4583-ae39-896816cdf447}

    [php]
    string getUsage ()

Le texte d'aide retourné est un texte multi-ligne avec le retour chariot Unix
(`\n`) comme séparateur de lignes.

### Avertissements {#core-ref:073d51b7-e73d-4cda-8db0-cf8a4a445271}

N/A

## Liste des paramètres {#core-ref:231bcbda-eb33-4297-9095-04a5606c7067}

N/A

## Valeur de retour {#core-ref:3cc714fd-a200-4e54-b808-e6c6f0cfea72}

Le message texte d'aide d'usage sur plusieurs lignes.

## Erreurs / Exceptions {#core-ref:e572d250-d6ac-4e15-b364-adf519256a96}

N/A

## Historique {#core-ref:afde67ef-cb1c-4a7f-a001-d79d929a19f4}

N/A

## Exemples {#core-ref:2968384e-c4e8-4e89-b932-458642f496b6}

    [php]
    function myaction1( Action & $action ) {
        $usage = new ActionUsage($action);
        
        $usage->setDefinitionText("Sample action");
        $docid = $usage->addRequiredParameter(
        	"id",
        	"Document id"
        );
        $format = $usage->addOptionalParameter(
        	"format",
        	"Paper format",
        	array(
    	        "a3",
    	        "a4",
    	        "a5"
    	    ),
    	    "a4"
    	);
        $usage->verify();
        ...
    }

    [bash]
    $ ./wsh.php --app=MYAPP --action=MYACTION1
    Erreur : {CORE0001} argument 'id' expected
    
    Sample action
    Usage :
            --app=MYAPP : <application_name>
            --action=MYACTION1 : <action_name>
            --id=<Document id>
        Options:
            --format=<Paper format> [a3|a4|a5], default is 'a4'

## Notes {#core-ref:c58158a0-2b24-46e9-8229-d5bf4bb6bd41}

N/A

## Voir aussi {#core-ref:25bb9941-9b47-447b-af09-daadf4819a6d}

- [`ApiUsage`][ApiUsage]

<!-- links -->
[ApiUsage]: #core-ref:dac6d107-3e77-48ba-8912-ffccd0061cbf