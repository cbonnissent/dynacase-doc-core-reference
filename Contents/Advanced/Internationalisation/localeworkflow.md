# Traduction des cycles de vies {#core-ref:10bf85d6-4171-11e3-8016-b38f13ee44c4}

Les éléments états, transition et activités des [cycles de vie][workflow] peuvent
être traduits, de la manière suivante :

    [php]
    namespace MyTest;
    
    class WflTest extends \Dcp\Family\WDoc
    {
        public $attrPrefix = "TST";
        public $firstState = self::etat_created;
        
        //region States
        const etat_created    = "myapp_tst_e1";
        const etat_redacted   = "myapp_tst_e2";
        //endregion
        
        //region Transitions
        const transition_created_redacted    = "myapp_tst_t1";
        const transition_redacted_created    = "myapp_tst_t2";
        //endregion
        
        // Activities
        public $stateactivity = array(
            self::etat_created    => "tst:activity:etat_created",
            self::etat_redacted   => "tst:activity:etat_redacted",
        );

Les clefs des états et des transitions sont leurs identifiants. Il est
nécessaire d'identifier ces clefs de traduction pour le programme de génération
de catalogue. Une des solutions consiste à ajouter une fonction factice qui sert
à identifier les éléments à traduire.

    [php]
    private function i18n () {
        $i18n=_("myapp_tst_e1"); // states
        $i18n=_("myapp_tst_e2");
        $i18n=_("myapp_tst_t1"); // transitions
        $i18n=_("myapp_tst_t2");
        $i18n=_("tst:activity:etat_created"); // activities
        $i18n=_("tst:activity:etat_redacted");
    }

Cette fonction peut être soit une fonction privée du cycle de vie, soit être
présente dans un autre fichier qui n'est pas déployé.

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
[workflow]:         #core-ref:b8824399-f17d-4007-adde-8a7433939273