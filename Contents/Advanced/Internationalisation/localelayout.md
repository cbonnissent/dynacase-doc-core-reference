# Utiliser une traduction dans un template {#core-ref:18dc3bda-3d6a-4590-9d9e-4a867a58ca7d}

Dans les [templates][layout], des textes simples (sans variable) peuvent faire
l'objet de traduction.

    [html]
    <h1>[TEXT:Welcome to my page]</h1>
    <p><label for="myInput">[TEXT:My Label]</label><input id="myInput"/></p>

Les textes indiqués par la syntaxe `[TEXT:<clef de traduction>]` sont remplacés
par la traduction issue du même catalogue que les textes traduits en PHP. Si la
traduction n'est pas trouvée dans le catalogue, le texte initial est affiché
(sans le '[TEXT:]').

Comme pour les traductions en PHP, il est possible d'utiliser une clef de
contexte pour démarquer sa traduction.

    [html]
    <h1>[TEXT(my Context):Welcome to my page]</h1>
    <p><label for="myInput">[TEXT(my Context):My Label]</label><input id="myInput"/></p>

Le contexte doit être écrit entre parenthèses juste après la clef `TEXT`.

Cette notation est aussi utilisable dans les [templates _ODT_][odttemplate].

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
[odttemplate]:      #core-ref:d03e0905-2be1-4649-a823-9f64e94cba29 