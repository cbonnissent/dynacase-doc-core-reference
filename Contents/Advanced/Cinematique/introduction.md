# Cinématique de dynacase {#core-ref:24705f94-2dee-4e84-9429-d89dafe83589}

## Que se passe t-il lors d'un appel à Dynacase {#core-ref:e7473e77-7bd3-4078-b209-975d44a8b095}

L'accès à Dynacase est fait soit via `index.php` (par défaut), soit via
`guest.php`.

* Accès par `index.php`

L'accès par `index.php` (accès par défaut) permet de se connecter avec un
compte utilisateur.

Si le paramètre `$useIndexAsGuest` est positionné à  `true` (voir [Accès
anonyme (invité)][guest]) et que l'utilisateur n'est pas authentifié, alors
l'accès sera autorisé et l'identité forcée à l'utilisateur `anonymous`.

![Accès par index.php](cinematique_index_php.png)

* Accès par `guest.php`

L'accès par `guest.php` autorise l'accès et force l'identité à l'utilisateur
`anonymous`.

![Accès par guest.php](cinematique_guest_php.png)

* Exécution de la requête

Une fois l'identité fixée (`anonymous` ou compte d'utilisateur), le traitement
de la requête se poursuit pour rechercher l'application et l'action à
exécuter.

![Exécution de la requête](cinematique_execute_request.png)

* Exécution de l'action de la requête

Lorsque l'action de l'application est fixée, l'action est alors exécutée.

L'action contrôle si l'utilisateur a le droit d'exécuter l'action demandée.

Si c'est une action de consultation d'un document (utilisation de
`viewcard()`), que l'utilisateur est `anonymous`, et que l'accès au document
n'est pas autorisé (voir [profil de documents][pdoc]), alors l'utilisateur est
redirigé vers l'authentification afin de se connecter sous un compte
utilisateur valide (voir [Consultation](#core-ref:76241972-720a-464f-a43b-04c9884b8101)
ci-dessous).

![Exécution de l'action de la requête](cinematique_action_execute.png)

## Que se passe t-il lors de l'accès à un document {#core-ref:415746bf-fdba-4335-a5ab-acc97f120a4d}

### Consultation {#core-ref:76241972-720a-464f-a43b-04c9884b8101}

La consultation d'un utilise la fonction `viewcard()`.

![Consultation d'un document](cinematique_viewcard.png)

### Modification {#core-ref:8d3f83e4-9d53-4d46-891f-074cb9501fa6}

La création d'un document utilise la fonction `editcard()`.

![Édition d'un document](cinematique_editcard.png)

## Que se passe t-il lors d'un changement d'état {#core-ref:d4019ea9-434b-4a47-80e2-7810f5f6efd9}

Le changement d'état utilise la fonction `modstate()`.

![Changement d'état d'un document](cinematique_modstate.png)

## Que se passe t-il lors d'un appel CLI (WSH) {#core-ref:f2428605-0c16-4941-8630-7b8ab8c45f20}

![Exécution CLI WSH](cinematique_wsh.png)

<!-- links -->
[guest]: #core-ref:932e2070-6929-11e2-8218-0021e9fffec1
[pdoc]: #core-ref:bdc11019-9650-4910-8182-2c9fcdee5fda