# Liste des balises utilisables en texte {#core-ref:32dea245-37e6-4a4c-a65e-06c577c0effa}

## Valeurs atomiques {#core-ref:e1c7f771-600b-44b8-b93a-294d318ac2e6}

Syntaxe :

    [php]
    [V_<attr-name>]
    [<tag>]

La valeur est la valeur positionnée par la méthode [`set()`][set].

Si la balise est de la forme `V_<attr-name>` et que `<attr-name>` est un
attribut du document, alors la valeur est celle de l'attribut `<attr-name>` du
document.

## Valeurs multiples {#core-ref:3c1efb99-99bf-415b-a4e2-a5f53ca5874c}

Syntaxe :

    [php]
    [BLOCK <tag>]...[ENDBLOCK <tag>]

Les balises contenues dans une balise de bloc prennent les valeurs spécifiés
par la méthode [`setBlockData()`][setBlockData].

L'évaluation d'un bloc est récursive, et les blocs résultants de l'évaluation
d'un bloc sont alors évalués à leur tour.

## Conditions {#core-ref:bfde7061-a6ea-4b17-9870-982c32a1a383}

Syntaxe :

    [php]
    [IF <tag>]...[ENDIF <tag>]
    [IFNOT <tag>]...[ENDIF <tag>]

Le contenu des balises conditionnelles est évalué, ou non, en fonction de la
valeur du `TAG` positionnée par la méthode [`set()`][set].

La valeur positionnée par [`set()`][set] doit être une valeur booléenne PHP :
`true` ou `false`.

## Internationalisation de texte {#core-ref:f9f06cf6-4caf-4c23-83ad-22c9899edd9f}

Syntaxe :

    [php]
    [TEXT:<msg-id>]

La valeur est le message d'internationalisation correspondant à la clef
`<msg-id>`.

## Images {#core-ref:90b27bee-e6be-4e08-8bef-37a1d2acbc55}

Syntaxe :

    [php]
    [IMG:<img-filename>]
    [IMG:<img-filename>|<img-width>]

La valeur est une URL permettant d'accéder à l'image `<img-filename>`
spécifiée.

Le chemin `<img-filename>` peut être le chemin d'un fichier image relatif à la
racine du contexte, ou bien un nom de fichier qui sera recherché de la manière
suivante :

* recherche dans le répertoire `Images` de l'application courante (e.g.
  `img.png` est alors cherché dans `FOO/Images` pour l'application courante
  `FOO`) ;
* si le fichier n'est pas trouvé et que l'application à des applications
  parentes, alors le fichier est recherché dans le répertoire `Images` des
  applications parentes.
* si le fichier n'est pas trouvé, alors le fichier est recherché dans le
  répertoire `Images` à la racine du contexte (e.g. `Images/img.png`)
* si le fichier n'est pas trouvé, alors l'image `CORE/Images/noimage.png` est
  utilisé à la place.

Si `|<width>` est présent, alors l'image est redimensionnée à la largeur
`width` demandée. Les proportions sont conservés par le redimensionnement.

## Zone {#core-ref:28f377e2-b9ee-4427-b2ef-7134eed2bf72}

Syntaxe :

    [php]
    [ZONE <app-name>:<action-name>?<arg>=<val>&...]

La valeur est le résultat de l'exécution de l'action `<action-name>` de
l'application `<app-name>` avec les arguments (`<arg>=<val>&...`) spécifiés.

## JavaScript {#core-ref:7753a743-e1f6-4afd-a8ad-10ba152cc904}

Syntaxe :

    [php]
    [JS:REF]
    [JS:CODE]
    [JS:CODENLOG]

Pour `[JS:REF]`, la valeur est un ensemble d'éléments HTML
`<script type="text/javascript" language="JavaScript" src="..." />` pour
charger le script `logmsg.js` et les scripts JavaScript ajoutés via la méthode
[`addJsRef()`][addJsRef].

Pour `[JS:CODE]`, la valeur est une chaîne de caractère contenant les
instructions JavaScript ajouté via la méthode [`addJsCode`][addJsCode], et un
code permettant d'afficher une alerte JavaScript des messages de log retournés
par l'action. L’élément HTML `<script type="text/javascript" language="JavaScript"/>`
n'est pas présent dans la valeur, par conséquent, il faut vous entouriez cet
élément par les tables HTML `<script>` et `</script>` (e.g.
`<script ...>[JS:CODE]</script>`).

Pour `[JS:CODENLOG]`, la valeur retournée est identique à `[JS:CODE]` à
l'exception du code permettant d'afficher l'alerte JavaScript des messages de
log retournés par l'action qui n'est pas présent.

## Règles de style CSS {#core-ref:1e7a8fbb-b34b-432e-821c-e60e73570236}

Syntaxe :

    [php]
    [CSS:REF]
    [CSS:CUSTOMREF]
    [CSS:CODE]

Pour `[CSS:REF]`, la valeur est un ensemble d'éléments HTML `<link
rel="stylesheet" ... />` pour charger le fichier CSS `css/dcp/system.css` et les
fichiers CSS ajoutés via la méthode [`addCssRef()`][addCssRef].

Pour `[CSS:CUSTOMREF]`, la valeur est identique à `[CSS:REF]` à l'exception du
fichier CSS `css/dcp/system.css` qui n'est pas présent.

Pour `[CSS:CODE]`, la valeur est une chaîne de caractère contenant les règles
CSS ajoutés via la méthode [`addCssCode()`][addCssCode]. L'élément HTML
`<style/>` n'est pas présent dans la valeur, par conséquent, il faut que vous
entouriez cet élément par les tags HTML `<style>` et `</style>`
(e.g. `<style>[CSS:CODE]</style>`).

<!-- links -->
[set]: #core-ref:812c30ed-11cb-4b59-84d2-ba10e4ab7e88
[setBlockData]: #core-ref:fb8a6d38-0bc7-469b-97d3-7cb8d6d3ea4b
[addJsRef]: #core-ref:b4b041aa-2649-498d-ace7-52131053c7db
[addJsCode]: #core-ref:49a8e28b-f286-45d7-b9e0-cc3591a8efde
[addCssRef]: #core-ref:4bba8a6b-8002-4c0a-8ac7-70d75b31b02b
[addCssCode]: #core-ref:5480ed21-5027-45c3-9efe-3897784b8865