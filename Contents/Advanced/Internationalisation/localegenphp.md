# Générer et mettre à jour les entrées du catalogue {#core-ref:2c163f00-8e94-4736-86f2-bb51352c52aa}

## Générer les catalogues pour les fichiers PHP {#core-ref:6feaa982-4171-11e3-9e01-48f953959281}

La génération des catalogues est effectuée traditionnellement par le programme
 [xgettext][xgettext].

    xgettext 
          --language=PHP \
          --keyword=___:1 \
          --keyword=___:1,2c \
          --keyword=n___:1,2 \
          --keyword=pgettext:1,2 \
          --keyword=n___:1,2,4c \
          --keyword=npgettext:1,2,4c \
          --keyword='N_'  \
          --keyword='text'  \
          --keyword='Text' \
          --from-code=utf-8  \
          --output=myCatalog.pot  myFile1.php myFile2.php ...

Cette fonction produit un catalogue de traduction temporaire permettant de
servir de base pour réaliser les traductions.

Le programme [`xgettextPhp`][buildtools] permet de réaliser la même fonction et récupère en
plus les libellés des [fonctions de recherche][searchLabel].
<span class="flag from release">3.2.12</span>

    ./buildTools/xgettextPhp --output=myCatalog.pot  myFile1.php myFile2.php
    
    myCatalog.pot wrote.

Les options de `xgettext` sont utilisables pour modifier le fichier produit.

    ./buildtools/xgettextPhp --omit-header --add-location -o myLayouts.pot test.html

Il est possible de déclarer les fichiers d'entrées via le pipe.

    find . -name "*php" | ../buildtools/xgettextPhp --output myCatalog.pot -f-

### Alternative  {#core-ref:208450f2-9ea3-43af-bfa7-7e40cebe6d87}

Il est possible de générer les catalogues par la programme [`dynacase-
devtool.phar`][devtoolphar].

    php dynacase-devtool.phar extractPo -s .

Voir le [`Quick Start`][quickpo] pour plus d'information.

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
[searchLabel]:      #core-ref:b318bafc-adf9-4ebc-802d-0cb1a8f82054 "search Label"
[buildtools]:       https://github.com/Anakeen/dynacase-buildtools   "Source BuildTools"
[quickpo]:          https://docs.anakeen.com/dynacase/3.2/dynacase-quick-start/website/book/quickstart:5b0e5ec5-1f8d-49ea-9953-42727cdc1b2b.html#quickstart:bec85337-36e8-4289-a938-f48b361e125e "Générer les catalogues avec devTool"
[devtoolphar]:      https://github.com/Anakeen/development-tools "Source DevTools"