# Utiliser un catalogue dans les fonctions javascript

Le module _dynacase-datajs_ fournit une bibliothèque javascript permettant
d'utiliser des traductions.

    [javascript]
    // Initialisation du contexte
    var C=new Fdl.Context({url:'http://www.mydomain.server/'});
    if (! C.isConnected()) {
        alert('error connect:'+C.getLastErrorMessage());
    return;
    }
    // Authentification
    if (! C.isAuthenticated()) {
        var u=C.setAuthentification({login:'mylogin',password:'secret'});
        if (!u)  alert('error authent:'+C.getLastErrorMessage());
    }
    // C is the context
    var helloText=C._("my test is ok");

La méthode `Fdl.Context::_()` retourne la traduction comme pour la fonction `_`
équivalente de PHP.

La langue choisie est celle de l'utilisateur (paramètre applicatif `CORE_LANG`).

## Génération du catalogue temporaire

Le programme `xgettextJs` permet générer le catalogue temporaire.

    ./buildTools/xgettextJs --output=myCatalog.pot  myFile1.js myFile2.js
    
    myCatalog.pot wrote.

Ce catalogue temporaire peut ainsi être utilisé pour produire les fichiers
catalogue de traduction.

## Publication du catalogue

Les catalogues sources (`.po`) doivent être publiés sur le serveur dans le
répertoire :

    locale/<lang>/js/src/

Les catalogues binaires (`.mo`) doivent être publiés sur le serveur dans le
répertoire :

    locale/<lang>/js/

Les catalogues sources sont prioritaires aux catalogues binaires. Cela implique
que s'il y a des clefs dupliquées c'est la traduction des fichiers sources qui
sera utilisée.

Le répertoire `<lang>` est l'identifiant de la locale sur deux lettres : 

-   `fr` : français
-   `en` : anglais

Plus de détails sur le paragraphe [Publication][popublish]


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
[popublish]:        #core-ref:7f5e9754-6db2-4dcb-ac99-e640f8a93c38 "Publication des catalogues"