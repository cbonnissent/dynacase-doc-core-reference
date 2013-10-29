# Publier et mettre à jour les catalogues {#core-ref:7f5e9754-6db2-4dcb-ac99-e640f8a93c38}

Les catalogues sources (`.po`) doivent être publiés sur le serveur dans le
répertoire :

    locale/<lang>/LC_MESSAGES/src/

Les catalogues binaires (`.mo`) doivent être publiés sur le serveur dans le
répertoire :

    locale/<lang>/LC_MESSAGES/

Les catalogues sources sont prioritaires aux catalogues binaires. Cela implique
que s'il y a des clefs dupliquées c'est la traduction des fichiers sources qui
sera utilisée.

Note : les catalogues binaires peuvent être obtenus par le programme `msgfmt` et
inversement les catalogues sources peuvent être obtenus par le programme
`msgunfmt`.

Le répertoire `<lang>` est l'identifiant de la locale sur deux lettres : 

-   `fr` : français
-   `en` : anglais

Pour prendre en compte les nouvelles traductions, il faut lancer le programme :

    $ ./whattext

sur le serveur depuis le répertoire d'installation. Ce programme va fusionner
l'ensemble des catalogues dans un catalogue principal. Ce catalogue sera chargé
lors de l'exécution des actions et scripts Dynacase.



<!-- link -->
[wikiGettext]:       http://fr.wikipedia.org/wiki/GNU_gettext "Gettext sur Wikipédia"
[phpGettext]:        http://www.php.net/manual/fr/function.gettext.php "gettext sur php.net"
[actions]:           #core-ref:e67d8aeb-939c-46e3-9be8-6fc3ba75ebc2 "Action Dynacase"
[wsh]:               #core-ref:4df1314f-9fdd-4a7f-af37-a18cc39f3505 "Script Dynacase"
[gencatalog]:        #core-ref:2c163f00-8e94-4736-86f2-bb51352c52aa
[pgettext]:          http://www.gnu.org/software/gettext/manual/html_node/Contexts.html "Contexte dans gettext"
[ngettext]:          http://www.php.net/manual/fr/function.ngettext.php "ngettext sur php.net"
[layout]:           #core-ref:5f4a2f4b-9ceb-42db-8ac1-2a7baa621ce2
[xgettext]:         http://www.gnu.org/software/gettext/manual/html_node/xgettext-Invocation.htm "xgettext reference"
[famdecl]:          #core-ref:cfc7f53b-7982-431e-a04b-7b54eddf4a75
[gettextutil]:      http://www.gnu.org/software/gettext/manual/html_node/index.html#Top