# les attributs {#core:4e167170-33ed-11e2-8134-a7f43955d6f3}

## présentation

Les attributs correspondent à des *champs* du document.

techniquement, ils correspondent à :

*   un champ de saisie en modification ;
*   une représentation textuelle en consultation ;
*   une colonne en base de données pour stocker la donnée.

Les attributs sont typés, et disposent d'options permettant de modifier leur comportement, leur représentation, etc.

Cette partie présente chaque type d'attribut, décrit son usage, ses représentations, et liste les options disponibles pour chacun de ces types.

Note sur les options : Dans Dynacase, les options sont *libres*, ce qui veut dire que vous pouvez utiliser vos propres options pour rajouter des informations sur certains attributs (par exemple, vous pourriez rajouter une option *inSpecialView* pour lister les attributs à afficher dans votre vue spéciale).
De par leur nature extensible, les options n'ont pas de valeur par défaut ;
aussi, dans leur description, nous indiquerons par *(comportement par défaut)* le comportement de l'option en l'absence de valeur.

### options communes à tous les types d'attributs {#core:16e19c90-3233-11e2-a58f-6b135c3a2496}

searchcriteria
:   Indique quelle sera l'utilisation de l'attribut dans les recherches.
    
    Les valeurs possibles sont :
    
    *   **`visible` (comportement par défaut)** : Dans ce cas
        
        *   l'attribut *est indexé* pour la recherche plein texte
        *   l'attribut *est présenté* dans les critères des recherches détaillées et des rapports
    
    *   `restricted` : Dans ce cas
        
        *   l'attribut *est indexé* pour la recherche plein texte
        *   l'attribut *n'est pas présenté* dans les critères des recherches détaillées et des rapports
    
    *   `hidden` : Dans ce cas
        
        *   l'attribut *n'est pas indexé* pour la recherche plein texte
        *   l'attribut *n'est pas présenté* dans les critères des recherches détaillées et des rapports

showempty
:   Indique que l'attribut doit être présenté en consultation, même si sa valeur est vide.
    
    Cela modifie le comportement par défaut, qui consiste à n'afficher en consultation que les attributs valués.
    
    Les valeurs possibles sont :
    
    *   `` (une chaîne vide) : Dans ce cas, le libellé sera présenté, et aucune valeur ne sera affichée
    *   toute chaîne de caractères : Dans ce cas, le libellé est affiché, et la valeur est remplacée par le texte donné.

sortable
:   Indique les modalités de tri de l'attribut.
    
    Par défaut, les attributs sont considérés comme non sortable.
    
    Les valeurs possibles sont :
    
    *   `asc` : Dans ce cas
        *   l'attribut sera présenté dans le menu de tri de *ONEFAM* et dans les rapports
        *   l'ordre de tri par défaut sera ascendant
    *   `desc` : Dans ce cas
        *   l'attribut sera présenté dans le menu de tri de *ONEFAM* et dans les rapports
        *   l'ordre de tri par défaut sera descendant

version
:   Indique que l'attribut est utilisé pour la composition de la *version*.
    Se reporter aux [propriétés de la classe Doc](#Core:9aa8edfa-2f2a-11e2-aaec-838a12b40353) pour plus de détails.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

vlabel
:   Indique la position du libellé de l'attribut.
    
    Les valeurs possibles sont :
    
    *   pour les attributs de type frame et onglet :
        
        *   **`up` (comportement par défaut)**
        *   `none`
    
    *   pour les attributs de type array :
        
        *   **`left` (valeur par défaut *en consultation*)**
        *   **`up` (valeur par défaut *en modification*)**
        *   `none`
    
    *   pour les autres attributs :
        
        *   **`left` (comportement par défaut)**
        *   `up`
        *   `none`

## action

### description

### représentation

### comportement

### format de stockage

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

batchfolder
:   Indique si l'action définie doit être appliquée sur tous les éléments du dossier.
    
    Option utilisable uniquement dans les familles dérivées de la famille *EXEC* (Traitement).
    Se reporter à la documentation de la famille *Traitement* pour plus de détails.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

## account

### description

Les attributs de type *account* permettent de faire un lien vers un compte (utilisateur, groupe, ou rôle).

### représentation

*   consultation :
    Un hyperlien vers l'utilisateur cible, avec comme label le titre l'utilisateur cible, et son icone.
    
    ![ account simple - consultation html ](famille/attributs/account-simple-consultation.png "account simple - Consultation html")

*   modification :
    
    Une aide à la saisie vers les comptes.
    
    ![ account simple - Modification html ](famille/attributs/account-simple-modification.png "account simple - Modification html")

*   odt :
    
    Le titre du document cible.
    
    ![ account simple - consultation odt ](famille/attributs/account-simple-odt.png "account simple - Consultation odt")

### comportement

Lors du rendu d'un account, dynacase récupère dynamiquement le titre des documents cibles.
Pour chaque document cible, si l'utilisateur n'a pas le droit de voir le document cible,
le titre est remplacé par le texte *Information non disponible* (se reporter à l'option noaccesstext pour personnaliser ce texte).

### format de stockage

La valeur stockée est l'id du document associé.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

group
:   Indique une restriction sur les comptes qui peuvent être référencés par la relation.
    
    L'aide à la saisie générée ne présentera que les comptes appartenant à ces groupes.
    
    Lorsque l'option *match* vaut *group*, seuls les sous-groupes des groupes référencés seront proposés.
    
    Cette option est incompatible avec *match=role*
    
    Les valeurs possibles sont :
    
    *   une liste de références de groupes (attribut *us_login*) séparés par des virgules

match
:   Indique une restriction sur les types de comptes qui peuvent être référencés par la relation.
    
    L'aide à la saisie générée ne présentera que les comptes ds types listés.
    
    Les valeurs possibles sont :
    
    *   **`user` (comportement par défaut)**
    *   `group`
    *   `role`
    *   `all`

multiple
:   Indique que plusieurs documents peuvent être référencés par la relation.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

noaccesstext
:   Indique le texte qui est affiché lorsque le document cible n'est pas visible.
    
    Cette valeur sera automatiquement ajoutée au catalogue de traduction.
    
    Les valeurs possibles sont :
    
    *   toute chaîne de caractères (sur une seule ligne).

role
:   Indique une restriction sur les comptes qui peuvent être référencés par la relation.
    
    L'aide à la saisie générée ne présentera que les comptes ayant ces rôles.
    
    Les valeurs possibles sont :
    
    *   une liste de référence de rôles séparés par des virgules

## array

### description

Les attributs de type *array* permettent de définir des tableaux.

Chacun des attributs contenu dans un *array* est alors dit *multiple*, et correspond à une colonne du dit *array*.

### représentation

Les array sont représentés au moyen d'une `table`.

Chaque colonne correspond à un attribut contenu dans l'array.
Le libellé de la colonne est le libellé de l'attribut correspondant.

*   consultation :
    
    Un tableau.
    
    ![ array - consultation html ](famille/attributs/array-consultation.png "array - Consultation html")

*   modification :
    
    La première colonne contient les outils permettant la sélection, suppression, et le déplacement d'une colonne,
    alors que la dernière ligne contient les outils permettant de rajouter une ligne ou de dupliquer une ligne existante.
    
    ![ array - Modification html ](famille/attributs/array-modification.png "array - Modification html")

*   odt :
    
    Un tableau
    
    ![ array - consultation odt ](famille/attributs/array-odt.png "array - Consultation odt")

### comportement

Aucun comportement particulier.

### format de stockage

Le tableau en lui même n'est pas stocké, mais modifie la façon dont les attributs qu'il contient sont stockés.
En effet, une fois dans un tableau, un attribut est multiple, et nécessite donc le stockage de plusieurs valeurs.
Pour rester simple, la valeur stockée sera une suite des valeurs de stockage simples séparées par un séparateur interne.

Pour plus de précisions, se reporter au chapitre avancé sur les formats de stockage.

### options applicables à l'array

cellbodystyle
:   Indique le style css appliqué sur les cellules du corps de tableau.
    
    Les valeurs possibles sont :
    
    *   toute définition css valide.

cellheadstyle
:   Indique le style css appliqué sur les cellules de l'entête de tableau.
    
    Les valeurs possibles sont :
    
    *   toute définition css valide.

classname
:   Indique une classe css à appliquer aux cellules du corps tableau en consultation.
    
    Les valeurs possibles sont :
    
    *   tout nom de classe valide.

empty
:   Indique que le tableau, s'il est vide ne doit pas afficher la première rangée en modification.
    Dans le cas contraire, en modification, le tableau est initialisé avec une rangée vide.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

height
:   Indique la hauteur du corps du tableau.
    Si le corps du tableau dépasse la hauteur spécifiée, un ascenseur vertical apparaîtra.
    
    Ne fonctionne qu'avec les navigateurs récents.
    
    Les valeurs possibles sont:
    
    *   Une taille en pixels (par exemple `150px`).

sorttable
:   Indique que le tableau est triable.
    L'utilisateur peut cliquer sur un en-tête de colonne pour trier cette colonne.
    
    Le tri est effectué au moyen du script [sorttable.js][SORTTABLEJS_home].
    
    L'utilisation avancée de sorttable.js sort du sujet de cette documentation, et est à charge et de la responsabilité du développeur.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

twidth
:   Indique la largeur du tableau.
    Si le corps du tableau dépasse la largeur spécifiée, un ascenseur horizontal apparaîtra.
    
    Les valeurs possibles sont :
    
    *   une valeur absolue en pixel (par exemple `100px`),
    *   une largeur relative en pourcentage (par exemple `30%`)
    
    La valeur par défaut est `100%`.

userowadd
:   Indique si l'utilisateur est autorisé à ajouter des rangées au tableau.
    Dans ce cas, le bouton correspondant est affiché.
    
    Cela permet de ne pas être en conflit si le tableau doit être rempli par un code spécifique sur l'interface, mais pas par l'utilisateur.
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

### options applicables aux attributs contenus dans un array

align
:   Indique l'alignement horizontal pour les cellules de la colonne.
    
    Les valeur possibles sont :
    
    *   `left`,
    *   `right`,
    *   `center`,
    *   `justify`

bgcolor
:   Indique la couleur de fond des cellules de la colonne.
    
    Les valeurs possibles sont :
    
    *   toute [couleur css valide][MDN_css_color_value]
        (exemple : `yellow`, `#FF335A`, etc.)

color
:   Indique la couleur du texte pour les cellules de la colonne.
    
    Les valeurs possibles sont :
    
    *   toute [couleur css valide][MDN_css_color_value]
        (exemple : `yellow`, `#FF335A`, etc.)

cwidth
:   Indique la largeur de la colonne.
    
    Les valeurs possibles sont :
    
    *   une valeur absolue en pixel (par exemple `100px`),
    *   une largeur relative en pourcentage (par exemple `30%`)
    *   **`auto` (comportement par défaut)**

## color

### description

Les attributs de type *color* permettent d'insérer une couleur.

### représentation

*   consultation :
    
    Un `span` contenant le code html de la couleur, et la couleur comme background.
    
    ![ color - consultation html ](famille/attributs/color-consultation.png "color - Consultation html")

*   modification :
    
    Un color picker basé sur [JSColor][JSCOLOR_home].
    
    ![ color - Modification html ](famille/attributs/color-modification.png "color - Modification html")

*   odt :
    
    Non utilisable

### comportement

Aucun comportement particulier.

### format de stockage

La valeur stockée est le code html de la couleur.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## date

### description

Les attributs de type *date* permettent d'insérer une date.

### représentation

*   consultation :
    
    La date formatée en accord avec la locale de l'utilisateur.
    
    ![ date - consultation html ](famille/attributs/date-consultation.png "date - Consultation html")

*   modification :
    
    Un date picker (basé sur [JSCalendar][JSCALENDAR_HOME]).
    
    ![ date - Modification html ](famille/attributs/date-modification.png "date - Modification html")

*   odt :
    
    La date formatée en accord avec la locale de l'utilisateur.
    
    ![ date - consultation odt ](famille/attributs/date-odt.png "date - Consultation odt")

### comportement

Lors de la saisie, la date est validée, c'est à dire que le format doit être :

*   soit au format « français » ;
*   soit au format « US » ;
*   soit au format ISO8601.

### format de stockage

La date est stockée au format ISO8601 (yyyy-mm-dd).

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## docid

### description

Les attributs de type *docid* permettent de faire un lien vers un ou plusieurs documents. Ils sont appelés *relations*.

Les attributs de type *docid* sont *typés*, c'est à dire qu'on précise de quelle famille doivent être les documents cible.
Cela se fait au moyen de la syntaxe *docid("&lt;family>")* (Dans ce cas, les documents doivent être de la famille *&lt;family>* ou d'une de ses sous-familles).

### représentation

*   consultation :
    
    Un hyperlien vers le document cible, avec comme label le titre du document cible, et l'icône du document
    
    ![ docid simple - consultation html ](famille/attributs/docid-simple-consultation.png "docid simple - Consultation html")

*   modification :
    
    une aide à la saisie vers les documents de la famille cible (et de ses sous-familles). L'aide à la saisie porte sur le titre uniquement, avec le filtre *contient, insensible à la casse*
    
    ![ docid simple - Modification html ](famille/attributs/docid-simple-modification.png "docid simple - Modification html")

*   odt :
    
    ![ docid simple - consultation odt ](famille/attributs/docid-simple-odt.png "docid simple - Modification odt")

### comportement

Lors du rendu d'un docid, dynacase récupère le titre des documents cibles.
Pour chaque document cible, si l'utilisateur n'a pas le droit de voir le document cible,
le titre est remplacé par le texte *Information non disponible* (se reporter à l'option *noaccesstext* pour personnaliser ce texte).

### format de stockage

La valeur stockée est l'id du document cible

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

creation
:   Indique qu'un document de la famille de la relation pourra être créé depuis le formulaire.
    
    Dans ce cas, un bouton sera ajouté sur le formulaire.
    Ce bouton ouvre un formulaire de création de la famille cible.
    Lors de la sauvegarde du nouveau document, ce nouveau document est inséré dans le docid de départ.
    
    Pour les relations multiples, le nouveau document sera inséré dans la liste des documents.
    
    Lorsque la relation est déjà renseignée, le bouton permet de modifier le document cible au lieu d'en créer un nouveau.
    Si le document lié n'est pas accessible en modification, il sera alors affiché en consultation.
    De même, le bouton n’apparaîtra que si l'utilisateur a le droit en création sur la famille liée.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   un *objet (Attention: bien que cela y ressemble, ce n'est pas du JSON)* construit de la manière suivante :
        *   Pour définir la valeur d'un attribut du document cible : `attrid_document_cible: "valeur"` (si la valeur est fixe),
            ou `attrid_document_cible: attrid_document_source` si la valeur est à recopier depuis le document source.
        *   Pour fermer la fenêtre de création lors de la sauvegarde : `autoclose: "yes"`
        *   Pour appeler de nouveau l'aide à la saisie lors de l'insertion de la valeur dans le document source : `recallhelper: "yes"`
            
            Cela peut être utile dans le cas où l'aide à la saisie doit remplir plusieurs attributs du document source.
        
        Par exemple, `creation={an_name:CT, an_reference :"une référence", an_target:en_source, recallhelper: "yes", autoclose: "yes"}` indique que :
        *   l'attribut *an_name* prendra comme valeur initiale *la valeur  actuellement saisie par l'utilisateur dans le champ de l'aide à la saisie
        *   l'attribut *an_reference* prendra la valeur *une référence*
        *   l'attribut *an_target* prendra la valeur de l'attribut *en_source* du document source
        *   l'aide à la saisie sera rappelée lors de la sauvegarde du document nouvellement créé
        *   la fenêtre de création du nouveau document sera fermée lors de sa sauvegarde.

docrev
:   Indique quelle est la révision pointée par la relation.
    
    Les valeurs possibles sont :
    
    *   **`latest` (comportement par défaut)** : Dans ce cas, la relation pointe vers la dernière révision de la lignée documentaire ;
    *   `fixed` : Dans ce cas, la relation pointe vers la révision ayant l'id référencé ;
    *   `state(step)`, où *step* est une étape : Dans ce cas, la relation pointe vers le dernier document à l'étape *step*.
    
    Cette option affecte le comportement de l'aide à la saisie générée :
    
    *   lorsque l'option a la valeur *latest*, c'est l'initid du document qui est retourné ;
    *   lorsque l'option a la valeur *fixed*, c'est le docid de la dernière révision au moment de l'appel qui est retourné ;
    *   lorsque l'option a la valeur *state(step)*, seuls les documents à l'étape *step* sont listés,
        et c'est le docid de la dernière révision à l'étape step au moment de l'appel qui est retourné.

doctitle
:   Indique qu'un attribut contenant le titre du document cible doit être automatiquement renseigné.
    
    Cela est notamment utile pour la recherche plein texte, les tris, etc.
    
    Les valeurs possibles sont :
    
    *   **`no` (comportement par défaut)** ;
    *   tout id d'attribut existant : Dans ce cas, l'attribut référencé contient le titre du document cible ;
    *   `auto` : Dans ce cas, un attribut est généré (son id est *&lt;id_de_la_relation>_title* et son titre est *&lt;titre_de_la_relation> (titre)* )

isuser
:   Indique quels attributs sont utilisables pour le profilage des documents.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   `no`
    
    Pour des raisons de compatibilité, la valeur par défaut est définie comme suit :
    *   si aucun attribut n'a l'option *isuser*, alors tous les attributs sont considérés comme utilisables pour le profilage ;
    *   si au moins un des attributs a l'option *isuser*, alors seuls les documents ayant l'option *isuser* à *yes* sont utilisables pour le profilage.

multiple
:   Indique que plusieurs documents peuvent être référencés par la relation.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

noaccesstext
:   Indique le texte qui est affiché lorsque le document cible n'est pas visible.
    
    Cette valeur sera automatiquement ajoutée au catalogue de traduction.
    
    Les valeurs possibles sont :
    
    *   toute chaîne de caractères.
    
    En l'absence de l'option, le texte affiché est *Information non disponible*

## double

### description

Les attributs de type *double* permettent d'insérer un nombre avec décimales.

### représentation

*   consultation :
    
    Le nombre, sans formatage
    
    ![ double - consultation html ](famille/attributs/double-consultation.png "double - Consultation html")

*   modification :
    
    un `input` de type `texte` permettant de saisir le nombre.
    
    ![ double - Modification html ](famille/attributs/double-modification.png "double - Modification html")

*   odt :
    
    Le nombre, sans formatage
    
    ![ double - consultation odt ](famille/attributs/double-odt.png "double - Consultation odt")

### comportement

Lors de l'enregistrement, le nettoyage suivant est effectué :

*   remplacement des `,` par `.`
*   suppression des espaces

La valeur nettoyée est validée au moyen de la fonction [is_numeric][PHP_is_numeric].

### format de stockage

La valeur stockée est la valeur nettoyée.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## enum

### description

Les attributs de type *enum* permettent d'insérer des listes de choix, sous la forme *clé|libellé*.

### représentation

*   consultation :
    
    Le libellé, traduit le cas échéant.
    
    ![ enum - consultation html ](famille/attributs/enum-consultation.png "enum - Consultation html")

*   modification :
    
    Un input de type select présentant les libellés traduits le cas échéant.
    
    ![ enum - Modification html ](famille/attributs/enum-modification.png "enum - Modification html")

*   odt :
    
    Le libellé, traduit le cas échéant.
    
    ![ enum - consultation odt ](famille/attributs/enum-odt.png "enum - Consultation odt")

### comportement

Aucun comportement particulier.

### format de stockage

La valeur stockée est la clé.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

bmenu
:   Indique si l'énuméré doit apparaître en tant que filtre dans les interfaces de l'application *GENERIC*
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

boolcolor
:   Indique que l'énuméré sera représenté (en consultation) par un carré de couleur.
    
    Les valeurs possibles sont :
    
    *   Un couple de [couleurs css valides][MDN_css_color_value] séparées par une virgule (par exemple `blue,#FF0000`).
        La première couleur indique la couleur de la première clé, et la seconde couleur celle de la seconde clé.

eformat
:   Indique le mode d'affichage de l'énuméré.
    
    Les valeurs possibles sont :
    
    *   **`list` (comportement par défaut)**
        
        *   Dans le cas d'un énuméré simple, il sera représenté
            *   en modification sous la forme d'un select traditionnel,
            *   en consultation sous la forme d'une chaîne contenant le label
        
        *   Dans le cas d'un énuméré multiple, il sera représenté
            *   en modification sous la forme d'un select traditionnel (avec utilisation de la touche ctrl pour sélectionner plusieurs valeurs,
            *   en consultation sous la forme d'une liste de chaînes contenant le label alignées verticalement
    
    *   `vcheck`
        
        *   Dans le cas d'un énuméré simple, il sera représenté
            *   en modification sous la forme de boutons radio alignés verticalement
            *   en consultation sous la forme d'une chaîne contenant le label
        
        *   Dans le cas d'un énuméré multiple, il sera représenté
            *   en modification sous la forme de checkbox alignées verticalement
            *   en consultation sous la forme d'une liste de valeurs alignées verticalement
    
    *   `hcheck`
        
        *   Dans le cas d'un énuméré simple, il sera représenté
            *   en modification sous la forme de boutons radio alignés horizontalement
            *   en consultation sous la forme d'une chaîne contenant le label
        
        *   Dans le cas d'un énuméré multiple, il sera représenté
            *   en modification sous la forme de checkbox alignées horizontalement
            *   en consultation sous la forme d'une liste de valeurs alignées horizontalement
    
    *   `auto`
        
        la présentation de l'énuméré sera similaire à celle d'un attribut de type `docid`
    
    *   `bool`
        
        Ne s'applique qu'aux énumérés à 2 valeurs.
        
        L'énuméré sera présenté
        
        *   en modification sous la forme d'une checkbox (coché sélectionne la seconde valeur, non coché reste sur la première valeur)
        *   en consultation sous la forme d'une chaîne contenant le label

esort
:   Indique l'ordre dans lequel les entrées seront listées.
    
    Les valeurs possibles sont :
    
    *   **`none` (comportement par défaut)** ;
    *   `key` : Dans ce cas, les propositions sont triées par ordre alphabétique des clés ;
    *   `label` : Dans ce cas, les propositions sont triées par ordre alphabétique des traductions des libellés.

etype
:   Indique si la valeur est restreinte aux valeurs de la liste.
    
    Les valeurs possibles sont :
    
    *   `free` : Dans ce cas, l'utilisateur peut saisir une valeur libre
    *   `open` : Dans ce cas, l'utilisateur peut également saisir une valeur libre.
        Cette valeur sera alors ajoutée à la liste des valeurs possibles pour les choix ultérieurs.

eunset
:   Indiquer que l'énuméré sera vide par défaut.
    
    S'il y a une valeur par défaut explicite pour l'attribut, l'option eunset est inopérante.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (par défaut)** : Dans ce cas, la valeur par défaut est la première des valeurs de l'énuméré selon sa définition.

mselectsize
:   Indique le nombre d'items présentés pour les énumérés multiples.
    
    Les valeurs possibles sont :
    
    *   tout entier.
    
    La valeur par défaut  est `3`.

multiple
:   Indique que l'énuméré peut être multivalué.
    
    Les énumérés multiples ne doivent pas être utilisés dans les tableaux.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

system
:   Indique que la gestion de l'énuméré ne peut pas être faite par l'IHM d'administration.
    
    Dans ce cas, la définition est écrasée à chaque import.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

## file

### description

Les attributs de type *file* permettent d'insérer un fichier.

### représentation

*   consultation :
    
    Un lien permettant de télécharger le fichier
    
    ![ file - consultation html ](famille/attributs/file-consultation.png "file - Consultation html")

*   modification :
    
    Un `input` de type `file`, avec le lien vers l'ancien fichier au dessus
    
    ![ file - Modification html ](famille/attributs/file-modification.png "file - Modification html")

*   odt :
    
    Le titre du fichier
    
    ![ file - consultation odt ](famille/attributs/file-odt.png "file - Consultation odt")

### comportement

Lors de l'upload du fichier, il est enregistré dans le *vault*.

### format de stockage

La valeur stockée est l'identifiant vault du fichier (sous la forme *&lt;type-mime>|&lt;vaultid>|&lt;file-title>*).

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

hideindav
:   Indique si le fichier apparaît lors de l'accès au moyen du protocole webdav.
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

inline
:   Indique si le fichier doit être consulté directement dans le navigateur.
    Dans le cas contraire, le téléchargement est forcé.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no`(comportement par défaut)**

pdffile
:   Utilisé conjointement avec l'option *viewfiletype*, indique l'attribut contenant le fichier pdf à afficher.
    
    Les valeurs possibles sont :
    
    *   tout id d'attribut de la famille en cours.

preventfilechange
:   Ajoute une contrainte pour que le fichier à remplacer provienne de la dernière version du serveur.
    
    Cela ne bloque pas un changement de fichier mais avertit l'utilisateur dans le cas où le fichier ne correspond pas à cette dernière version.
    
    Lors du téléchargement du fichier un code identifiant la version est ajouté dans le nom du fichier (exemple foo{i47307-56}.ods pour le fichier foo.ods).
    Lorsque l'utilisateur envoie à nouveau le fichier, le serveur vérifie ce numéro de version. Si le numéro correspond à la dernière version, alors le fichier est accepté. Dans le cas contraire, une confirmation est demandée à l'utilisateur.
    
    Attention: si l'utilisateur renomme le fichier, la vérification échoue, et le serveur demande la confirmation.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

rn
:   Indique que le fichier sera renommé sur le serveur.
    
    Les valeurs possibles sont :
    
    *   un nom de méthode de la famille courante (par exemple `::myNewName()`).
        La méthode prend en entrée le nom du fichier et doit retourner le nouveau nom sous la forme d'une chaîne de caractères.
    
    Note: Il est recommandé que la méthode fournisse une extension compatible avec le type mime pour l'utilisation ultérieure sur le poste client et les transformations.
    Pour récupérer l'extension d'un nom de fichier vous pouvez utiliser la fonction `getFileExtension` de la librairie `Lib.FileMime.php`

search
:   Indique si l'attribut est indexé pour la recherche plein-texte.
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

template
:   Indique si l'attribut file est un template.
    
    se reporter à la documentation des templates OOO pour les explications
    
    Les valeurs possibles sont :
    
    *   `static`
    *   `dynamic`

viewfileheigth
:   Utilisé conjointement avec l'option *viewfiletype*, indique la hauteur du rendu affiché sur le navigateur.
    
    Les valeurs possibles sont :
    
    *   Une taille en pixels (par exemple `150px`).
    *   Une taille en pourcentage de la hauteur de la fenêtre (par exemple `80%`)
    
    Il n'y a pas de valeur par défaut

viewfiletype
:   Indique qu'une prévisualisation du fichier sera disponible dans le navigateur, ne nécessitant donc pas de logiciel tiers.
    
    Les valeurs possibles sont :
    
    *   `pdf` : Dans ce cas, l'attribut indiqué par l'option *pdffile* sera utilisé comme prévisualisation ;
    *   `image` : Dans ce cas, le moteur de transformation génère une visualisation sous forme d'images avec tourne pages du pdf référencé par l'option *pdffile*.

## frame

### description

Les attributs de type *frame* permettent de regrouper des attributs.
Ce regroupement sera le plus souvent sémantique.

### représentation

*   consultation :
    
    un `fieldset` entourant les attributs contenus dans cette frame. Le titre du cadre est dans une balise `legend`.
    
    ![ frame - consultation html ](famille/attributs/frame-consultation.png "frame - Consultation html")

*   modification :
    
    un `fieldset` entourant les attributs contenus dans cette frame. Le titre du cadre est dans une balise `legend`.
    
    ![ frame - Modification html ](famille/attributs/frame-modification.png "frame - Modification html")

*   odt :
    
    Aucune représentation

### comportement

Une frame est *collapsible* en cliquant sur son libellé.

### format de stockage

Cet attribut n'est pas stocké.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

bgcolor
:   Indique la couleur de fond du cadre.
    
    Les valeurs possibles sont :
    
    *   toute [couleur css valide][MDN_css_color_value]
        (exemple : `yellow`, `#FF335A`, etc.)

## htmltext

### description

Les attributs de type *htmltext* permettent d'insérer du texte avec mise en forme.

Le langage de mise en forme est le html, et un éditeur WYSIWYG (basé sur [CKEditor][CKEDITOR_home]) permet d'en simplifier la saisie.

### représentation

*   consultation :
    
    une `div` contenant la valeur.
    
    ![ htmltext - consultation html ](famille/attributs/htmltext-consultation.png "htmltext - Consultation html")

*   modification :
    
    une `iframe` dans laquelle est initialisé une instance de CKEditor.
    
    ![ htmltext - Modification html ](famille/attributs/htmltext-modification.png "htmltext - Modification html")

*   odt :
    
    la mise en forme est conservée. <span class="fixme MCO">capture + détails suite à correction de [#3283](http://dev.dynacase.org/issues/3283)</span>

### comportement

Lors de l'enregistrement, le nettoyage suivant est effectué :

*   Les balises `script` et `noscript` sont remplacées par des balises `pre` ;
*   Les entités UTF-8 sont décodées ;
*   Les commentaires sont supprimés.

### format de stockage

La valeur stockée est le html *nettoyé* selon les règles précédentes.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

doclink
:   Cette option nécessite l'installation du module dynacase-ckeditor-plugins.
    
    Active l'option doclink du HTMLEditor. Cette option se présente sous la forme d'un nouveau bouton (dans la partie réservée au lien dans les toolbar et en fin de toolbar sur la Basic), en cliquant sur le bouton une interface vous propose de sélectionner un document et ajoute une balise de lien vers ce document.
    
    Les valeurs possibles sont :
    
    *   un objet JSON (par exemple `{"famId": "DIR", "docrev" : "fixed"}`), contenant les propriétés suivantes :
        *   `famId` (obligatoire) : nom logique de la famille des documents cible,
        *   `docrev` (facultatif) : les valeurs possibles sont les mêmes que l'option *docrev* des attributs de type *docid* (latest, fixed, state(keystate)),
        *   `filter` (facultatif) : un filtre SQL qui sera appliqué à la recherche

editheight
:   Indique la hauteur de la zone d'édition.
    
    Les valeurs possibles sont :
    
    *   une taille en pixels (par exemple `400px`)
    
    La valeur par défaut est `150px`.

htmlclean
:   Indique que le serveur nettoiera le contenu en supprimant toutes les balises de style, généralement issues d'un copier/coller :
    
    *   les attribut des balises `span` et `font` sont supprimés ;
    *   les attributs `@class` et `@style` sont supprimés ;
    *   les balises `style` sont supprimés.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

jsonconf
:   Cette option permet de configurer finement l'éditeur de texte WYSIWYG.
    
    Elle permet notamment de fixer finement le comportement de l'éditeur et le contenu des toolbar.
    Les options de configuration sont [celles de CKEditor][CKEDITOR_option], et l'objet de configuration doit être présenté en JSON valide.
    
    Les options propres à CKEditor (*resize*, *correction orthographique*, etc) ne sont pas maintenues par Anakeen
    et leur bon fonctionnement n'est pas garanti par Anakeen.
    
    Aux options de CKEDITOR, dynacase ajoute les options suivantes :
    
    *   addPlugin : permet de charger un plugin additionnel.
        
        La valeur doit être un tableau (JSON) de noms logiques de plugins (par exemple: `"addPlugins": ["docattr"]`).
        Dans ce cas, le plugin doit posséder une commande ayant le même nom que le nom logique du plugin.
        Cette commande est alors ajoutée en fin de toolbar.
    
    Exemple de configuration permettant d'activer le plugin docattr et le plugin doclink et avec un menu basique et l'activation du mode resize :
    `jsonconf={"addPlugins" : ["docattr"], "doclink" :   {"famId" : "DIR"}, "toolbar" : "basic", "resize_enabled" : "true"}`
    
    **Attention** : l'utilisation de cette option bas niveau désactive les options suivantes :
    
    *   toolbar
    *   toolbarexpand
    *   editheight
    *   doclink
    
    Il est par contre possible de construire une option *jsonconf* qui a le même effet que les options précédentes.

toolbar
:   Indique le template à utiliser pour la barre de menu.
    
    Les valeurs possibles sont :
    
    *   **`Simple` (comportement par défaut)** :
        
        ![toolbar Simple](famille/attributs/htmltext-toolbar-simple.png)
    
    *   `Basic` :
        
        ![toolbar Basic](famille/attributs/htmltext-toolbar-basic.png)
    
    *   `Default` :
        
        ![toolbar Default](famille/attributs/htmltext-toolbar-default.png)
    
    *   `Full` :
        
        ![toolbar Full](famille/attributs/htmltext-toolbar-full.png)

toolbarexpand
:   Indique si la barre de menu doit être dépliée lors de l'affichage de l'éditeur.
    Dans le cas contraire, un petit bouton permet de la déplier.
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

## idoc

**Obsolète**

## ifile

permet d'intégrer directement la visualisation d'un fichier.
**Obsolète** (préférer une vue d'attribut lorsque nécessaire)

En consultation, cet attribut sera représenté par une iframe affichant le fichier en mode inline.

## image

### description

Les attributs de type *image* permettent d'insérer une image.

### représentation

*   consultation :
    
    une balise `img` alignée à droite.
    
    ![ image - consultation html ](famille/attributs/image-consultation.png "image - Consultation html")

*   modification :
    
    un `input` de type `file`, avec le lien vers l'ancienne image au dessus.
    
    ![ image - Modification html ](famille/attributs/image-modification.png "image - Modification html")

*   odt :
    
    Une image.
    
    ![ image - consultation odt ](famille/attributs/image-odt.png "image - Consultation odt")

### comportement

Lors de l'upload du fichier, il est enregistré dans le *vault*.

### format de stockage

La valeur stockée est l’identifiant vault du fichier (sous la forme *&lt;type-mime>|&lt;vaultid>|&lt;file-title>*).

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

hideindav
:   Indique si le fichier apparaît lors de l'accès au moyen du protocole webdav.
    
    Les valeurs possibles sont :
    
    *   **`yes` (comportement par défaut)**
    *   `no`

inline
:   Indique si l'image' doit être consultée directement dans le navigateur.
    Dans le cas contraire, le téléchargement est forcé.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no`(comportement par défaut)**

iwidth
:   Indique la largeur de l'image.
    
    L'image est redimensionnée coté serveur, avec respect des proportions.
    
    Les valeurs possibles sont:
    
    *   Une taille en pixels (par exemple `150px`).
    *   `auto` (dans ce cas, l'image est affichée dans sa taille originale).
    
    La valeur par défaut est `80px`.

preventfilechange
:   Ajoute une contrainte pour que le fichier à remplacer provienne de la dernière version du serveur.
    
    Cela ne bloque pas un changement de fichier mais avertit l'utilisateur dans le cas où le fichier ne correspond pas à cette dernière version.
    
    Lors du téléchargement du fichier un code identifiant la version est ajouté dans le nom du fichier (exemple foo{i47307-56}.ods pour le fichier foo.ods).
    Lorsque l'utilisateur uploade à nouveau le fichier, le serveur vérifie ce numéro de version.
    Si le numéro correspond à la dernière version, alors le fichier est accepté.
    Dans le cas contraire, une confirmation est demandée à l'utilisateur.
    
    Attention: si l'utilisateur renomme le fichier, la vérification échoue, et le serveur demande la confirmation.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

rn
:   Indique que le fichier sera renommé sur le serveur.
    
    Les valeurs possibles sont :
    
    *   un nom de méthode de la famille courante (par exemple `::myNewName()`).
        La méthode prend en entrée le nom du fichier et doit retourner le nouveau nom sous la forme d'une chaîne de caractères.
    
    Note: Il est recommandé que la méthode fournisse une extension compatible avec le type mime pour l'utilisation ultérieure sur le poste client et les transformations.
    Pour récupérer l'extension d'un nom de fichier vous pouvez utiliser la fonction `getFileExtension` de la librairie `Lib.FileMime.php`

## integer

### description

Les attributs de type *integer* permettent d'insérer un nombre entier.

### représentation

*   consultation :
    
    Le nombre, sans formatage.
    
    ![ integer - consultation html ](famille/attributs/integer-consultation.png "integer - Consultation html")

*   modification :
    
    Un input de type texte permettant de saisir le nombre.
    
    ![ integer - Modification html ](famille/attributs/integer-modification.png "integer - Modification html")

*   odt :
    
    Le nombre, sans formatage
    
    ![ integer - consultation odt ](famille/attributs/integer-odt.png "integer - Consultation odt")

### comportement

Lors de la sauvegarde, les vérifications suivantes sont faites :

*   Le nombre est un entier

### format de stockage

La valeur stockée est la valeur brute du nombre.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## longtext

### description

Les attributs de type *longtext* permettent de saisir du texte multilignes, sans mise en forme.

### représentation

*   consultation :
    
    La valeur brute.
    
    ![ longtext - consultation html ](famille/attributs/longtext-consultation.png "longtext - Consultation html")

*   modification :
    
    Un textarea.
    
    ![ longtext - Modification html ](famille/attributs/longtext-modification.png "longtext - Modification html")

*   odt :
    
    La valeur brute.
    
    ![ longtext - consultation odt ](famille/attributs/longtext-odt.png "longtext - Consultation odt")

### comportement

Aucun comportement particulier

### format de stockage

La valeur stockée est la valeur brute.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

editheight
:   Indique la hauteur du `textarea` correspondant.
    
    Les valeurs possibles sont :
    
    *   une [taille css valide][MDN_css_length_value] (par exemple `400px`)
    
    La valeur par défaut est `2em`

elabel
:   Valeur de l'attribut `@title` du `textarea` correspondant.
    
    Les valeurs possibles sont :
    
    *   Toute chaîne de caractères. Attention, la plupart des navigateurs n'acceptent pas de retour chariot.

## menu

### description

Les attributs de type *menu* se présentent sous la forme de liens en haut du document.

Ces menus permettent d'accéder à des urls, et ainsi de déclencher des actions, etc.

### représentation

*   consultation :
    
    Une entrée de menu supplémentaire.
    
    ![ menu - consultation html ](famille/attributs/menu-consultation.png "menu - Consultation html")

*   modification :
    
    Aucune représentation.

*   odt :
    
    Aucune représentation.

### comportement

Le menu n'est pas représenté dans les cas suivants:

*   *link* est vide
*   le menu référence des attributs au moyen de la syntaxe *&lt;attrid>* et un de ces attributs est vide (cela peut être contourné par l'utilisation de la syntaxe ?&lt;attrid>).

### format de stockage

Cet attribut n'est pas stocké.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

barmenu
:   Indique que la popup doit s'ouvrir avec la barre de menus du navigateur.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

global
:   Indique que l'action effectuée par le menu n'est pas liée à un document en particulier.
    
    Dans ce cas, le menu apparaît aussi dans le menu 'outils' des applications issues de GENERIC, ainsi que dans le menu contextuel du document famille.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

lconfirm
:   Indique qu'une confirmation doit être demandée avant activation du lien.
    
    Le texte de la confirmation est déterminé par l'option *tconfirm*.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

mheight
:   Indique la hauteur de la popup.
    
    Les valeurs possibles sont :
    
    *   toute hauteur en pixels (par exemple `400px`)
    
    La valeur par défaut est **`300px`**

mtarget
:   Indique le *name* de la fenêtre cible de l'hyperlien.
    
    Les valeurs possibles sont :
    
    *   **`_blank` (comportement par défaut)** : Dans ce cas, la fenêtre cible est une nouvelle fenêtre ;
    *   `_self` : Dans ce cas, la fenêtre cible est la fenêtre en cours ;
    *   `fhidden` : Dans ce cas, la fenêtre cible est une fenêtre cachée ;
    *   `fdoc` : Dans l'application *ONEFAM*, la fenêtre cible est la fenêtre dans laquelle est affiché le document (utile pour les menus avec l'option *global*) ;
    *   tout nom de fenêtre valide.

mwidth
:   Indique la largeur de la popup.
    
    Les valeurs possibles sont :
    
    *   toute largeur en pixels (par exemple `400px`)
    
    La valeur par défaut est **`400px`**

onlyglobal
:   Utilisé conjointement avec l'option *global*, indique que le menu ne doit pas apparaître sur le document.
    
    Les valeurs possibles sont :
    
    *   `yes`
    *   **`no` (comportement par défaut)**

submenu
:   Indique que le menu doit avoir un menu parent.
    
    Les valeurs possibles sont :
    
    *   toute chaîne alphanumérique.

tconfirm
:   Indique la question apparaissant pour la confirmation (ce doit être une question fermée).
    
    Cette question est automatiquement ajoutée au catalogue de traduction.
    
    Les valeurs possibles sont :
    
    *   toute chaîne de caractères.
    
    La valeur par défaut est **`Êtes-vous sûr ?`**

## money

### description

Permet de représenter un format monétaire.

### représentation

*   consultation :
    
    Le nombre, formaté au moyen de la fonction [`money_format('%!.2n', …)`][PHP_money_format].
    
    ![ money - consultation html ](famille/attributs/money-consultation.png "money - Consultation html")

*   modification :
    
    un input de type texte permettant de saisir le nombre.
    
    ![ money - Modification html ](famille/attributs/money-modification.png "money - Modification html")

*   odt :
    
    Le nombre, formaté au moyen de la fonction [`money_format('%!.2n', )`][PHP_money_format].
    
    ![ money - consultation odt ](famille/attributs/money-odt.png "money - Consultation odt")

### comportement

Lors de l'enregistrement, le nettoyage suivant est effectué :

*   remplacement des `,` par `.`
*   suppression des espaces

La valeur nettoyée est validée au moyen de la fonction [is_numeric][PHP_is_numeric].

### format de stockage

La valeur stockée est la valeur nettoyée.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## password

### description

Les attributs de type *password* permettent d'insérer des valeurs sans en dévoiler le contenu.

### représentation

*   consultation :
    
    La valeur avec les caractères remplacés par des étoiles.
    
    ![ password - consultation html ](famille/attributs/password-consultation.png "password - Consultation html")

*   modification :
    
    Un `input` de type `password`.
    
    ![ password - Modification html ](famille/attributs/password-modification.png "password - Modification html")

*   odt :
    
    Aucune représentation

### comportement

En édition, le champ password est sytématiquement présenté vide. Lors de la sauvegarde, si la valeur est vide, alors l'ancienne valeur est conservée.

### format de stockage

La valeur stockée est la valeur brute.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## tab

### description

Les attributs de type *tab* permettent de créer des onglets.

### représentation

*   consultation :
    
    Un onglet.
    
    ![ tab - consultation html ](famille/attributs/tab-consultation.png "tab - Consultation html")

*   modification :
    
    Un onglet.
    
    ![ tab - Modification html ](famille/attributs/tab-modification.png "tab - Modification html")

*   odt :
    
    Aucune représentation

### comportement

Aucun comportement particulier.

### format de stockage

Cet attribut n'est pas stocké.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

viewonfly
:   Indique que le contenu du tab est chargé en ajax lorsque l'utilisateur clique sur l'onglet.
    Cela réduit le temps de réponse pour les documents ayant de très nombreux attributs (plusieurs centaines).
    
    Cela n'est applicable que pour les vues utilisant la zone *FDL:VIEWBODYCARD*.
    Les actions utilisant cette zone sont :
    
    *   *FDL:FDL_CARD*,
    *   *FDL:IMPCARD*,
    *   *FDL:OPENDOC*,
    *   *FDL:VIEWEXTDOC*.
    
    Les valeurs possibles sont :
    
    *    `yes`
    *    **`no` (comportement par défaut)**

firstopen
:   Indique que cet onglet doit être sélectionné à l'ouverture du document.
    
    Cela n'est applicable que pour les vues utilisant les zones *FDL:VIEWBODYCARD* et *FDL:EDITBODYCARD*.
    Les actions utilisant cette zone sont :
    
    *   *FDL:FDL_CARD*,
    *   *FDL:IMPCARD*,
    *   *FDL:OPENDOC*,
    *   *FDL:VIEWEXTDOC*,
    *   *GENERIC:GENER
    
    Les valeurs possibles sont :
    
    *    `yes`
    *    **`no` (comportement par défaut)**

## text

### description

Les attributs de type *text* permettent d'insérer du texte simple, sur une seule ligne.

### représentation

*   consultation :
    
    La valeur brute.
    
    ![ text - consultation html ](famille/attributs/text-consultation.png "text - Consultation html")

*   modification :
    
    un `input` de type `text`.
    
    ![ text - Modification html ](famille/attributs/text-modification.png "text - Modification html")

*   odt :
    
    La valeur brute.
    
    ![ text - consultation odt ](famille/attributs/text-odt.png "text - Consultation odt")

### comportement

Lors de la sauvegarde, la valeur est nettoyée :

*   le caractère *"\r"* est remplacé par *" "* (espace).

### format de stockage

La valeur stockée est la valeur nettoyée.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

elabel
:   Valeur de l'attribut `@title` de l'`input` correspondant.
    
    Les valeurs possibles sont :
    
    *   Toute chaîne de caractères. Attention, la plupart des navigateurs n'acceptent pas de retour chariot.

esize
:   Valeur de l'attribut `@size` de l'`input` correspondant.
    
    Les valeurs possibles sont :
    
    *   Toute valeur entière.

## time

### description

Les attributs de type *time* permettent d'insérer une heure.

### représentation

*   consultation :
    
    La valeur brute.
    
    ![ time - consultation html ](famille/attributs/time-consultation.png "time - Consultation html")

*   modification :
    
    2 inputs de type text, séparés par le symbole *:*.
    Du javascript transforme les entrées pour en faire des heures valides
    (les nombres sont remplacés par leur modulo respectif avec 24 et 60, et les autres valeurs sont remplacées par 00).
    
    ![ time - modification time ](famille/attributs/time-modification.png "time - Modification html")

*   odt :
    
    La valeur brute.
    
    ![ time - consultation odt ](famille/attributs/time-odt.png "time - Consultation odt")

### comportement

Lors de la sauvegarde, la valeur est nettoyée :

*   remplacement de l'heure par son modulo 24
*   remplacement des minutes par leur modulo 60
*   le cas échéant, remplacement des secondes par leur modulo 60

La valeur est vérifiée, et doit correspondre à un des formats suivants :

*   .\*:.\*
*   .\*:.\*:.\*

### format de stockage

La valeur stockée est la valeur nettoyée.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## timestamp

### description

Les attributs de type *timestamp* permettent d'insérer une date et heure.

### représentation

*   consultation :
    
    La date et heure formatée en accord avec la locale de l'utilisateur.
    
    ![ timestamp - consultation html ](famille/attributs/timestamp-consultation.png "timestamp - Consultation html")

*   modification :
    
    date picker avec possibilité de définir l'heure.
    
    ![ timestamp - Modification html ](famille/attributs/timestamp-modification.png "timestamp - Modification html")

*   odt :
    
    La date et heure formatée en accord avec la locale de l'utilisateur.
    
    ![ timestamp - consultation odt ](famille/attributs/timestamp-odt.png "timestamp - Consultation odt")

### comportement

Lors de la saisie, la valeur est validée, c'est à dire que le format doit être :

*   soit au format « français » ;
*   soit au format « US » ;
*   soit au format ISO8601.

### format de stockage

La date est stockée au format ISO8601 « sans T » (yyyy-mm-dd hh:mm:ss).

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

## xml

### description

Le type *XML n'est utilisable que pour des besoins internes de core. Seule la famille "SEARCH" l'utilise.

### représentation

Les attributs de type *xml* sont représentés comme du texte simple.

### options

En plus des [options communes à tous les types d'attributs](#core:16e19c90-3233-11e2-a58f-6b135c3a2496), ce type d'attribut dispose des options suivantes :

<!-- links -->
[MDN_css_color_value]: https://developer.mozilla.org/en-US/docs/CSS/color_value "description du type css color sur MDN"
[MDN_css_length_value]: https://developer.mozilla.org/en-US/docs/CSS/length "description du type css length sur MDN"
[PHP_money_format]: http://php.net/manual/fr/function.money-format.php "documentation de money_format sur php.net"
[PHP_is_numeric]: php.net/manual/function.is-numeric.php "documentation sur php.net"
[CKEDITOR_home]: http://ckeditor.com/ "Site officiel de CKEditor"
[CKEDITOR_option]: http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html "options de CKEDITOR"
[SORTTABLEJS_home]: http://www.kryogenix.org/code/browser/sorttable/ "site officiel de sorttable.js"
[JSCOLOR_home]: http://jscolor.com/ "site officiel de JSColor"
[JSCALENDAR_HOME]: http://www.dynarch.com/projects/calendar/old/ "site officiel de JSCalendar"