# Catalogue de traduction {#core-ref:ca73ff9e-ceb8-456b-bdd4-9b9056f1543d}

## Utiliser une traduction dans un programme PHP {#core-ref:967cd878-e068-4c99-8266-adaed3f700ff}

### Utiliser une forme simple

La fonction fournie en standard par PHP et la fonction [gettext][phpGettext].
Cette fonction permet de rechercher dans un catalogue la traduction
correspondante au texte donné en paramètre.

    [php]
    // texte simple
    print gettext("This is a text");
    // texte avec une partie variable
    printf(gettext("An error : [%s]"), $errorText);

Note : La fonction `_` de PHP est un alias de `gettext`.

    [php]
    // écriture plus lisible en utilisant l'alias.
    print _("This is a text");
    printf(_("An error : [%s]"), $errorText);


**Attention** : La fonction `gettext` doit avoir comme argument un texte non vide.
Si le texte est une chaîne vide alors c'est la description du catalogue qui est
retournée.

Le texte à traduire est généralement écrit en anglais et ne comporte pas de
caractère accentué. Ceci permet d'éviter les problème d'encodage lors de la
génération du catalogue. Il est cependant possible de mettre des textes à
traduire avec des accents (voir [chapitre suivant][gencatalog]).

Dans l'exemple précédent, le texte est très commun et il peut être défini dans
un autre module avec une traduction différente. 

Deux possibilités permette de diminuer ce risque de doublon.

1.  Mettre un préfixe
    
        [php]
        print _("MyCatalog:This is a text");

2.  Mettre un contexte
    
        [php]
        print ___("This is a text", "MyContext");

La différence entre le préfixe et le [contexte][pgettext] est que le contexte est
explicitement indiqué dans le catalogue tandis que le préfixe est pris comme un
texte simple.

La fonction `___` (triple blancs soulignés) est un alias de la fonction
`pgettext`. Ses fonctions ne sont pas natives de PHP. Si le contexte est vide,
cela est équivalent à l'utilisation de la fonction `_` standard.


La fonction `N_` permet d'ajouter une forme localisée au catalogue sans la
traduite directement.

    [php]
    $a=N_("Hello world"); // to be added by xgettext
    // can be save in session for example
    $action->register("myText", $a);
    
    // reuse variable in other context
    $b=$action->read("myText", "no text");
    print _($b);
    

### Utiliser une forme plurielle

Les traductions des formes plurielles sont prises en compte par la bibliothèque
_gettext_.

La forme plurielle est indiquée à l'aide la fonction php standard
[ngettext][ngettext] ou de la fonction `npgettext` et son alias `n___` qui
gèrent aussi les contextes.

    [php]
    
    printf(n___("%d document found", "%d documents found", $num, "MyContext") , $num);


| langue | $num |    texte traduit    |   forme   |
| ------ | ---- | ------------------- | --------- |
| fr     |    0 | 0 document trouvé   | singulier |
| fr     |    1 | 1 document trouvé   | singulier |
| fr     |    2 | 2 documents trouvés | pluriel   |
| fr     |  345 | 345 document trouvé | pluriel   |
|        |      |                     |           |
| en     |    0 | 0 documents found   | pluriel   |
| en     |    1 | 1 document found    | singulier |
| en     |    2 | 2 documents found   | pluriel   |
| en     |  345 | 345 document found  | pluriel   |

Les formes plurielles sont gérés par le catalogues par l'entête `Plural-Forms`

    msgid ""
    msgstr ""
    "Project-Id-Version: Test 1.0\n"
    "POT-Creation-Date: 2013-10-24 17:28+0200\n"
    "PO-Revision-Date: 2013-10-25 08:53+0200\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "Language: French\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=n>1;\n"
    
    

Pour un même langage, la définition des formes plurielles doit être identiques.
Un catalogue français ne peut avoir deux plurielles alors qu'un autre en défini
trois.

Pour le français la définition de la forme plurielle doit être :

    "Plural-Forms: nplurals=2; plural=n>1;\n"

Pour l'anglais la définition de la forme plurielle doit être :

    "Plural-Forms: nplurals=2; plural=n != 1;\n"

Limitations : La localisation des formes plurielles fonctionne de manière
partielle avec les nombres décimaux. En effet, la variable numérique de choix de
la traduction doit être un entier. Pour un nombre décimal, seule la partie
entière est prise en compte. Ainsi les nombres _1,3_ et _1,6_ seront pris comme
_1_. Cela sera correct pour le français qui considère que tout nombre compris
entre _]-2, 2[_ comme singulier. Mais cela sera incorrect en anglais qui
considère que tout nombre différent de 1 ou -1 n'est pas singulier.

Note : Lors de la génération du catalogue principal, c'est l'entête utilisée
dans le  fichier `header.mo` qui défini l'entête et donc la forme plurielle
utilisée.


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