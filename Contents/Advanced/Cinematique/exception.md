# Gestion des erreurs et des exceptions {#core-ref:4bc5157a-5dbc-4d87-b1e5-ece7e104dc20}

Dynacase a un système permettant de gérer, logger et notifier les exceptions et les erreurs PHP.

Ce système permet d'afficher un message mis en forme à l'utilisateur en cas d'exception et d'enregistrer un contexte
le plus précis possible pour aider le développeur à résoudre le problème.

## Gestion des erreurs {#core-ref:45089e36-0c3a-456c-b8e8-9d8c83bf8cfd}

Les erreurs PHP sont interceptées et traitées par la fonction `handleFatalShutdown`. Celle-ci les présente sous la
forme d'un cadre rouge indiquant une défaillance dans l'exécution de Dynacase. Le log est délégué à PHP.

## Gestion des exceptions {#core-ref:fc9bbaaa-2420-4875-b168-9c9ad8a0675d}

Les exceptions remontant jusqu'au plus niveau (`index.php`, `guest.php`) sont mises en forme et sont logguées ainsi que
leur trace d'exécution dans le fichier de log d'erreur.

## Fonction de rappel à l'extinction {#core-ref:9f3475a2-b6a5-4927-b6b7-97f128cb4cd4}

Si vous déclarez une fonction de rappel pour exécution à l'extinction, à l'aide
de [`register_shutdown_function()`][php_register_shutdown_function], cette
dernière sera ou non exécutée en fonction des cas suivants :

Exception
:   Exécution de la fonction rappel : Oui
    
    Lorsqu'une exception est levé et qu'elle est non attrapée, alors votre
    fonction de rappel est appelée après l'exécution de la fonction de rappel
    [`handleFatalShutdown`][handleFatalShutdown] de Dynacase.

Exit
:   Exécution de la fonction rappel : Oui
    
    Lorsque le script PHP se termine (par appel ou non à la fonction `exit()`),
    la fonction de rappel est appelée.

PHP Fatal error
:   Exécution de la fonction rappel : Oui
    
    Lorsque le script génère une erreur "PHP Fatal" (e.g. "Max execution time
    exceeded", "Call to undefined function"), la fonction de rappel est
    appelée.

Signal
:   Exécution de la fonction rappel : Non
    
    Lorsqu'un signal `SIGINT` est reçu par le process, si PHP est dans un
    syscall (e.g. `sleep()`, `fwrite()`, etc.), alors le syscall se termine et
    retourne une erreur (ou le nombre d'octets écrit pour une fonction comme
    `fwrite()`). Lors de la réception de `SIGTERM` et `SIGQUIT`, le signal est
    interprété par Apache et la fonction de rappel n'est pas appelée.

Déconnections du client
:   Exécution de la fonction de rappel : Oui (si flush réguliers, sinon
    exécution en fin de script, voir cas `Exit` ci-dessus)
    
    Par défaut `ignore_user_abort` est à `Off`, et permet donc à PHP de se
    terminer si le client se déconnecte.
    
    Par contre, la prise en compte de la déconnexion ne se fera qu'après que le
    client ait fait une tentative d'écriture sur le flux de sortie (et que le
    flux est flushé, sinon la sortie est bufferisée et rien ne se passe non
    plus).
    
    Si le client n'écrit rien sur le flux de sortie, alors il continue de
    s'exécuter.
    
    Lorsque le client fait une écriture (`print` + `ob_flush()` + `flush()`),
    alors le script se termine et le shutdown handler est exécuté. Dans le
    shutdown handler on peut alors interroger `connection_aborted()` pour
    savoir si le client s'est déconnecté ou non).
    
    Le `access_log` et le `error_log` Apache ne mentionnent rien tant que le
    code PHP s'exécute.
    
    Quand le code se termine, alors `access_log` contient un "HTTP 200 OK",
    `error_log` ne mentionne rien.
    
    On a donc pas trace de la déconnexion du client sur le serveur si on
    n'interroge pas `connection_aborted()` régulièrement ou dans le shutdown
    handler.
    
    Plusieurs niveaux de bufferisation dans PHP :
    
        print "xxx" 
          |
          v
        PHP's userspace output buffer (ob_*)    <-- Utiliser ob_flush()
          |
          v
        PHP's system write buffer    <-- Utiliser flush() 
          |
          v
        Client


<!-- links -->
[php_register_shutdown_function]: http://php.net/manual/function.register-shutdown-function.php
[handleFatalShutdown]: #core-ref:45089e36-0c3a-456c-b8e8-9d8c83bf8cfd
