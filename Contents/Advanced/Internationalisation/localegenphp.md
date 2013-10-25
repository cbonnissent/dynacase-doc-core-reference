# Générer et mettre à jour les entrées du catalogue {#core-ref:2c163f00-8e94-4736-86f2-bb51352c52aa}

## Générer les catalogues pour les fichiers PHP

La génération des catalogues est effectuée par le programme [xgettext][xgettext].

    xgettext 
          --language=PHP
          --keyword=___:1
          --keyword=___:1,2c
          --keyword=n___:1,2
          --keyword=n___:1,2,4c
          --keyword='N_' 
          --keyword='text' 
          --keyword='Text'
          --from-code=utf-8 
          --output=myCatalog.po  myFile1.php myFile2.php ...


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