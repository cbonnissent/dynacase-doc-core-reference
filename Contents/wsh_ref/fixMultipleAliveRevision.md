# fixMultipleAliveRevision {#core-ref:6b3d41c4-e94c-41ab-adbc-51069ab7119d}

## Description {#core-ref:67d4fe2f-5dea-418c-8752-e395001a14d7}

Le script `fixMultipleAliveRevision` permet de corriger les erreurs de
« multiple alive revision ».

Une erreur de « multiple alive revision » correspond à un document révisé qui
comporte plus d'une révision vivante (un document ne pouvant avoir qu'une et une
seule révision vivante).

## Usage {#core-ref:6ffebf62-7223-4caf-a24c-e41afd1cd06a}

Le script ne prend pas d'argument : il recherche et corrige un niveau de
révision à chaque exécution de celui-ci.

Le script est à exécuter itérativement jusqu'à ce que ce dernier ne retourne
plus aucune erreur à corriger.

## Limite d'usage {#core-ref:32e843a3-97cd-49d3-84ab-698d203b6da1}

N/A
