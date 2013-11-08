# Cinématique de la requête d'une action {#core-ref:e7473e77-7bd3-4078-b209-975d44a8b095}

L'accès à Dynacase est fait soit via `index.php` (par défaut), soit via
`guest.php`.

## Accès par `index.php` {#core-ref:29754cb0-0903-4f81-8fb0-c56d7ba2efba}

L'accès par `index.php` (accès par défaut) permet de se connecter avec un
compte utilisateur.

Si le paramètre `$useIndexAsGuest` est positionné à  `true` (voir [Accès
anonyme (invité)][guest]) et que l'utilisateur n'est pas authentifié, alors
l'accès sera autorisé et l'identité forcée à l'utilisateur `anonymous`.

![Accès par index.php](cinematique_index_php.png)

## Accès par `guest.php` {#core-ref:737cad60-c7e4-4455-83f4-27fad0aa7332}

L'accès par `guest.php` autorise l'accès et force l'identité à l'utilisateur
`anonymous`.

![Accès par guest.php](cinematique_guest_php.png)

## Exécution de la requête {#core-ref:009929b6-8ffa-4306-add7-14cbdb41e6b4}

Une fois l'identité fixée (`anonymous` ou compte d'utilisateur), le traitement
de la requête se poursuit pour rechercher l'application et l'action à
exécuter.

![Exécution de la requête](cinematique_execute_request.png)

## Exécution de l'action de la requête {#core-ref:d9e77c8b-d7df-473c-8082-fc4d210eb098}

Lorsque l'action de l'application est fixée, l'action est alors exécutée.

L'action contrôle si l'utilisateur a le droit d'exécuter l'action demandée.

Si c'est une action de consultation d'un document (utilisation de
`viewcard()`), que l'utilisateur est `anonymous`, et que l'accès au document
n'est pas autorisé (voir [profil de documents][pdoc]), alors l'utilisateur est
redirigé vers l'authentification afin de se connecter sous un compte
utilisateur valide (voir [Consultation](#core-ref:76241972-720a-464f-a43b-04c9884b8101)
ci-dessous).

![Exécution de l'action de la requête](cinematique_action_execute.png)


<!-- links -->
[guest]:        #core-ref:932e2070-6929-11e2-8218-0021e9fffec1
[pdoc]:         #core-ref:bdc11019-9650-4910-8182-2c9fcdee5fda
[wsh]:          #core-ref:1566c46d-a53d-44cf-8c3f-0d0e21c0b117
[workflow]:     #core-ref:55a53d99-0c24-48d8-8cb9-1caa171f2e9a