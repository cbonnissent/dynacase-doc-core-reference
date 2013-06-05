# Paramètres de Core {#core-ref:1d088722-af08-4b99-93a2-ad84214617dd}

## Paramètres système {#core-ref:e8c259c9-35b9-47c9-b7cf-55150741d159}

### `CORE_URLINDEX` {#core-ref:9081464e-dfc9-4836-8577-cfa59829eaa0}

Url d'accès à l'index de dynacase.

*   Type : `G`
*   Défaut : &lt;vide>
*   Exemple : `http://www.example.net/dynacase/`

### `CORE_EXTERNURL` {#core-ref:b3965d07-3673-434c-949f-78a551b1e089}

Url d'accès au serveur.

Elle est composée à partir du [paramètre `CORE_URLINDEX`][CORE_URLINDEX].

Si ce dernier n'est pas renseigné, elle est composée en fonction de l'url
d'accès à l'action.

## Paramètres relatifs aux mails {#core-ref:999fb6ba-87bd-46bb-a134-30c4938c7532}

### `CORE_MAILACTION` {#core-ref:c1d9e009-49a5-47a4-9104-4d044ea24aa3}

Url d'accès à dynacase pour les liens des mails envoyés par dynacase.

*   Type : `G`
*   Défaut : ` ` (vide)
*   Exemple : `http://www.example.net/dynacase/?app=MY_APP&action=MY_ACTION`

### `CORE_MAILACTIONURL` {#core-ref:033299c3-fe9a-4833-9dbd-45952bdf63bc}

Url d'accès au serveur pour les mails envoyés par Dynacase.

Elle est composée à partir du [paramètre `CORE_MAILACTION`][CORE_MAILACTION].
Si ce dernier n'est pas renseigné, elle est composée en fonction du [paramètre
`CORE_EXTERNURL`][CORE_EXTERNURL].

<!-- links -->
[CORE_MAILACTION]: #core-ref:c1d9e009-49a5-47a4-9104-4d044ea24aa3
[CORE_EXTERNURL]: #core-ref:b3965d07-3673-434c-949f-78a551b1e089
[CORE_URLINDEX]: #core-ref:9081464e-dfc9-4836-8577-cfa59829eaa0
