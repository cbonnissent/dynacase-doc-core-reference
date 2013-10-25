# Ajouter une nouvelle langue {#core-ref:2b79d76a-fe0d-446e-bee4-c73e36f64a41}

Pour disposer d'une nouvelle langue, il faut publier un nouveau fichier
`lang.php` de définition de langue dans le sous-répertoire de la langue en
dessous dans le répertoire `locale` .

Exemple pour ajouter l'espagnol :

Fichier : `locale/es/lang.php`

    [php]
    $lang["es_ES"] = array(
        "label" => "Espagnol",
        "localeLabel" => _("Spanish"),
        "flag" => "",
        "locale" => "es",
        "dateFormat" => "%d/%m/%Y",
        "dateTimeFormat" => "%d/%m/%Y %H:%M",
        "timeFormat" => "%H:%M:%S",
    );
    /*
     ** Include local/override config
     ** -----------------------------
    */
    $local_lang = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'local-lang.php';
    if (file_exists($local_lang)) {
        include ($local_lang);
    }

Ensuite, il faut publier l'ensemble des traductions nécessaires dans le nouveau
répertoire dédiée au nouveau langage `locale/es/LC_MESSAGES/`.

**Important** : Pour que les locales soient prises en compte, il faut que le
système d'exploitation est connaissance de ces locales. La liste des locales du 
système est obtenue avec la commande `locale-gen`.

    # locale-gen
    Generating locales...
      en_US.UTF-8... done
      es_ES.UTF-8... up-to-date
      fr_FR.UTF-8... done
    Generation complete.


Les locales **UTF-8** doivent être générées.
Cette même commande permet aussi d'ajouter de nouvelle locale au système.




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