# Classe ApiUsage {#core-ref:dac6d107-3e77-48ba-8912-ffccd0061cbf}

La classe `ApiUsage` gère la définition et la validation des paramètres lors
l'appel et l'exécution de [scripts CLI][scripts_cli].

Elle permet de spécifier et contrôler la présence de paramètres requis ou
optionnels, et de retourner un texte d'aide précisant les paramètres requis
lorsque la validation échoue.

## Constructeur {#core-ref:b3b0722f-d719-4363-b560-24d9b19bb294}

    [php]
    new ApiUsage ( Action & $action )

### Liste des paramètres {#core-ref:d05688c3-7d87-4123-9e37-d781bb86ae32}

(Action) `action`
:   L'objet `$action` courant.

### Exemples {#core-ref:2d8ea59e-5b34-4c26-b3bb-2c7da600d41c}

    [php]
    global $action;
    
    $usage = new ApiUsage($action);
    $docId = $usage->addRequiredParameter("id", "document id");
    $usage->verify();
    
    doSomeThingWith($docId);

&nbsp;

    $ ./wsh.php --api=test
    Erreur : {CORE0001} argument 'id' expected
    
    
    Usage :
            --id=<document id>
       Options:
            --userid=<user system id or login name to execute function - default is (admin)>, default is '1'
            --help (Show usage) 

### Notes {#core-ref:398e3dc2-5638-4d52-9466-f51093aba642}

Aucune.

### Voir aussi {#core-ref:285db216-6ea9-48f1-97ce-68069305724f}

Aucun.

<!-- links -->
[scripts_cli]: #core-ref:1566c46d-a53d-44cf-8c3f-0d0e21c0b117