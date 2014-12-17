# Gestion des erreurs et des exceptions {#core-ref:4bc5157a-5dbc-4d87-b1e5-ece7e104dc20}

Dynacase a un système permettant de gérer, logger et notifier les exceptions et les erreurs PHP.

Ce système permet d'afficher un message mis en forme à l'utilisateur en cas d'exception et d'enregistrer un contexte
le plus précis possible pour aider le développeur à résoudre le problème.

## Gestion des erreurs {#core-ref:45089e36-0c3a-456c-b8e8-9d8c83bf8cfd}

Les erreurs PHP sont interceptées et traitées par la fonction `handleFatalShutdown`. Celle-ci les présente sous la
forme d'un cadre rouge indiquant une défaillance dans l'éxécution de Dynacase. Le log est délégué à PHP.

## Gestion des exceptions {#core-ref:fc9bbaaa-2420-4875-b168-9c9ad8a0675d}

Les exceptions remontant jusqu'au plus niveau (`index.php`, `guest.php`) sont mises en forme et sont logguées ainsi que
leur trace d'éxécution dans le fichier de log d'erreur.