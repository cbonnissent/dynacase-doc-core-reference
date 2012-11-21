# Paramétrage de Core {#core-ref:cfc7f53b-7982-431e-a04b-7b54eddf4a75}
 
<span class="fixme template"> template for famille/parametrage_de_core.md.</span>

## introduction

Pour paramétrer une application Dynacase, on va utiliser divers formats de fichier :

*   Les familles seront définies dans des fichiers csv ;
*   Le code php sera à déployer dans des fichiers php, à intégrer à la plate-forme ;
*   Les documents systèmes seront importés au moyen de fichiers csv ou xml.

## Définition de familles

Les familles sont définies dans un fichier csv respectant le format suivant:

*   Encodage : UTF-8,
*   Délimiteur de texte : `` (vide),
*   séparateur de colonnes : `;`.

Exemple de définition d'une famille :

    BEGIN;;Animal;;;ZOO_ANIMAL;;;;;;;;;;;
    //;properties;;;;;;;;;;;;;;;
    //propid;value;;;;;;;;;;;;;;;
    ICON;zoo_animal.png;;;;
    METHOD;Method.zoo_animal.php;;;;
    DFLDID;FLD_ZOO_ANIMAL;;;;
    ;;;;;;;;;;;;;;;;
    //;attributes;;;;;;;;;;;;;;;
    //;idattr;idframe;label;T;A;type;ord;vis;need;link;phpfile;phpfunc;elink;constraint;option;Commentaires
    ;;;;;;;;;;;;;;;;
    ATTR;AN_IDENTIFICATION;;Identification;N;N;frame;100;W;;;;;;;;
    ATTR;AN_NOM;AN_IDENTIFICATION;nom;Y;N;text;110;W;Y;;;;;;edittemplate=ZOO:ANIMALNAME:U|viewtemplate=ZOO:ANIMALNAME;
    ATTR;AN_TATOUAGE;AN_IDENTIFICATION;tatouage;N;N;int;120;W;;;;;;;edittemplate=ZOO:ANIMALTATOO:S|viewtemplate=ZOO:ANIMALTATOO:S;
    ATTR;AN_ESPECE;AN_IDENTIFICATION;espèce;N;N;docid('ZOO_ESPECE');130;W;Y;;;;;;creation={es_nom:CT}|doctitle=an_espece_title;
    ATTR;AN_ESPECE_TITLE;AN_IDENTIFICATION;espèce (titre);Y;N;text;140;H;;;;::getTitle(an_espece);;;;
    ATTR;AN_ORDRE;AN_IDENTIFICATION;ordre;N;N;text;150;R;;;;::getdocvalue(an_espece,es_ordre);;;;
    ATTR;AN_CLASSE;AN_IDENTIFICATION;classe;N;N;docid("ZOO_CLASSE");160;R;;;;::getdocvalue( an_espece , es_classe);;;doctitle=auto;
    ATTR;AN_SEXE;AN_IDENTIFICATION;sexe;N;N;enum;170;W;;;;M|Masculin,F|Féminin,H|Hermaphrodite;;;;
    ATTR;AN_PHOTO;AN_IDENTIFICATION;photo;N;N;image;180;W;;;;;;;;
    ATTR;AN_NAISSANCE;AN_IDENTIFICATION;date naissance;N;N;date;190;W;;;;;;::validatePastDate(AN_NAISSANCE);;
    ATTR;AN_ENTREE;AN_IDENTIFICATION;date entree;N;N;date;200;W;;;;;;::validatePastDate(AN_ENTREE);;
    ATTR;AN_ENFANT_T;AN_IDENTIFICATION;liste enfant;N;N;array;210;W;;;;;;;;
    ATTR;AN_ENFANT;AN_ENFANT_T;enfant;N;N;docid("ZOO_ANIMAL");220;W;;;;;;;creation={an_nom:CT,an_espece:an_espece};
    ATTR;AN_CARNETSANTE;AN_IDENTIFICATION;Carnet Santé;N;N;menu;230;W;;%S%app=GENERIC&action=GENERIC_ISEARCH&id=%I%&famid=ZOO_CARNETSANTE&viewone=Y;;;;;;
    ATTR;AN_ENCLOS;AN_IDENTIFICATION;Enclos;N;N;menu;240;W;;%S%app=GENERIC&action=GENERIC_ISEARCH&id=%I%&famid=ZOO_ENCLOS&viewone=Y;;;;;;
    ATTR;AN_PARENT;AN_IDENTIFICATION;Parents;N;N;menu;250;W;;%S%app=GENERIC&action=GENERIC_ISEARCH&generic=Y&id=%I%&famid=ZOO_ANIMAL;;;;;;
    ATTR;AN_PERE;AN_IDENTIFICATION;pere;N;Y;docid('ZOO_ANIMAL');260;R;;;;::getAscendant(M);;;doctitle=auto
    ATTR;AN_MERE;AN_IDENTIFICATION;mere;N;Y;docid('ZOO_ANIMAL');270;R;;;;::getAscendant(F);;;doctitle=auto
    ATTR;AN_FOLDER;;Dossier;N;N;menu;10;W;;%S%app=ZOO&action=ZOO_ANIMALFOLDER&id=%I%;;;;;
    ;;;;;;;;;;;;;;;;
    END;;;;;;;;;;;;;;;;

Ce qui donne, vu dans un tableau :<span class="fixme MCO">ajout de `div.table{overflow: auto;}` dans la css<style>div.table{overflow: auto;}</style></span>

|          |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| -        |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| BEGIN    |                       | Animal            |                |   | ZOO_ANIMAL |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| //       | properties            |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| //propid | value                 |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| ICON     | zoo_animal.png        |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| METHOD   | Method.zoo_animal.php |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| DFLDID   | FLD_ZOO_ANIMAL        |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
|          |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| //       | attributes            |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| //       | idattr                | idframe           | label          | T | A          | type                | ord | vis | need | link                                                                         | phpfile | phpfunc                               | elink      | constraint                       | option                                   | Commentaires                   |  |  |
|          |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_IDENTIFICATION     |                   | Identification | N | N          | frame               | 100 | W   |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_NOM                | AN_IDENTIFICATION | nom            | Y | N          | text                | 110 | W   | Y    |                                                                              |         |                                       |            |                                  | edittemplate=ZOO:ANIMALNAME:U            | viewtemplate=ZOO:ANIMALNAME    |  |  |
| ATTR     | AN_TATOUAGE           | AN_IDENTIFICATION | tatouage       | N | N          | int                 | 120 | W   |      |                                                                              |         |                                       |            |                                  | edittemplate=ZOO:ANIMALTATOO:S           | viewtemplate=ZOO:ANIMALTATOO:S |  |  |
| ATTR     | AN_ESPECE             | AN_IDENTIFICATION | espèce         | N | N          | docid('ZOO_ESPECE') | 130 | W   | Y    |                                                                              |         |                                       |            |                                  | creation={es_nom:CT}                     | doctitle=an_espece_title       |  |  |
| ATTR     | AN_ESPECE_TITLE       | AN_IDENTIFICATION | espèce (titre) | Y | N          | text                | 140 | H   |      |                                                                              |         | ::getTitle(an_espece)                 |            |                                  |                                          |                                |  |  |
| ATTR     | AN_ORDRE              | AN_IDENTIFICATION | ordre          | N | N          | text                | 150 | R   |      |                                                                              |         | ::getdocvalue(an_espece,es_ordre)     |            |                                  |                                          |                                |  |  |
| ATTR     | AN_CLASSE             | AN_IDENTIFICATION | classe         | N | N          | docid("ZOO_CLASSE") | 160 | R   |      |                                                                              |         | ::getdocvalue( an_espece , es_classe) |            |                                  | doctitle=auto                            |                                |  |  |
| ATTR     | AN_SEXE               | AN_IDENTIFICATION | sexe           | N | N          | enum                | 170 | W   |      |                                                                              |         | M                                     | Masculin,F | Féminin,H                        | Hermaphrodite                            |                                |  |  |
| ATTR     | AN_PHOTO              | AN_IDENTIFICATION | photo          | N | N          | image               | 180 | W   |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_NAISSANCE          | AN_IDENTIFICATION | date naissance | N | N          | date                | 190 | W   |      |                                                                              |         |                                       |            | ::validatePastDate(AN_NAISSANCE) |                                          |                                |  |  |
| ATTR     | AN_ENTREE             | AN_IDENTIFICATION | date entree    | N | N          | date                | 200 | W   |      |                                                                              |         |                                       |            | ::validatePastDate(AN_ENTREE)    |                                          |                                |  |  |
| ATTR     | AN_ENFANT_T           | AN_IDENTIFICATION | liste enfant   | N | N          | array               | 210 | W   |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_ENFANT             | AN_ENFANT_T       | enfant         | N | N          | docid("ZOO_ANIMAL") | 220 | W   |      |                                                                              |         |                                       |            |                                  | creation={an_nom:CT,an_espece:an_espece} |                                |  |  |
| ATTR     | AN_CARNETSANTE        | AN_IDENTIFICATION | Carnet Santé   | N | N          | menu                | 230 | W   |      | %S%app=GENERIC&action=GENERIC_ISEARCH&id=%I%&famid=ZOO_CARNETSANTE&viewone=Y |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_ENCLOS             | AN_IDENTIFICATION | Enclos         | N | N          | menu                | 240 | W   |      | %S%app=GENERIC&action=GENERIC_ISEARCH&id=%I%&famid=ZOO_ENCLOS&viewone=Y      |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_PARENT             | AN_IDENTIFICATION | Parents        | N | N          | menu                | 250 | W   |      | %S%app=GENERIC&action=GENERIC_ISEARCH&generic=Y&id=%I%&famid=ZOO_ANIMAL      |         |                                       |            |                                  |                                          |                                |  |  |
| ATTR     | AN_PERE               | AN_IDENTIFICATION | pere           | N | Y          | docid('ZOO_ANIMAL') | 260 | R   |      |                                                                              |         | ::getAscendant(M)                     |            |                                  | doctitle=auto                            |                                |  |  |
| ATTR     | AN_MERE               | AN_IDENTIFICATION | mere           | N | Y          | docid('ZOO_ANIMAL') | 270 | R   |      |                                                                              |         | ::getAscendant(F)                     |            |                                  | doctitle=auto                            |                                |  |  |
| ATTR     | AN_FOLDER             |                   | Dossier        | N | N          | menu                | 10  | W   |      | %S%app=ZOO&action=ZOO_ANIMALFOLDER&id=%I%                                    |         |                                       |            |                                  |                                          |                                |  |  |
|          |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |
| END      |                       |                   |                |   |            |                     |     |     |      |                                                                              |         |                                       |            |                                  |                                          |                                |  |  |


La définition d'une famille commence toujours par une ligne de la forme :

    BEGIN;[fromid];[title];[id];[className];[logicalName]

et se termine toujours par une ligne de la forme :

    END;

avec les correspondances suivantes:

BEGIN
:   Obligatoire, signale le début d'une définition de famille

[fromid]
:   Identifiant logique (nom logique ou id) de la famille de laquelle cette famille hérite.
    Mettre vide s'il n'y a pas d'héritage.

    L'utilisation d'un id à la place d'un nom logique est à réserver aux familles de core.

[title]
:   Titre de la famille.

    Ce titre est utilisé sur les interfaces pour désigner la famille.

    Il est automatiquement ajouté au catalogue de traduction, et peut ainsi être traduit.

[id]
:   Identifiant numérique de la famille.

    Le laisser à vide pour utiliser un identifiant logique.
    S'il est valué il faut que cet identifiant ne soit pas déjà pris par un autre document.
    Les valeurs entre 900 et 999 peuvent être utilisée pour vos besoins spécifiques.
    L'usage de valeurs numériques fixe est fortement déconseillée.

[className]
:   Nom de la classe PHP de cette famille. Cette classe doit être présente sur le serveur dans un fichier appelé `/FDL/Class.[CLASSNAME].php`.

    Le laisser à vide pour que Dynacase génère la classe automatiquement.

    Permet un héritage autre que celui prévu par défaut par les classes documentaire.

[logicalName]
:   Nom logique de la famille.

    Doit commencer par une lettre.
    Il ne peut ensuite contenir que des caractères alphanumériques ainsi que les caractères _ et - (pas d'espace, ni de ponctuation).

END
:   Obligatoire, signale la fin d'une définition de famille

Entre ces 2 lignes, chacune des lignes correspond à :

*   un commentaire

    Une ligne qui ne sera pas traitée lors du traitement de la définition de famille.

    Un commentaire commence toujours par `//`.

    Par exemple

        //propid;value;;;;;;;;;;;;;;;

*   un [paramètre de propriété](#core:40d229c4-33c4-11e2-9147-a3eaf356c37c)
*   une [propriété de famille](#core:6f013eb8-33c7-11e2-be43-373b9514dea3)
*   un [attribut](#core:bc3fad86-33cc-11e2-9a69-1bbd9c32b0f2)
*   un paramètre
*   une valeur par défaut
*   une valeur initiale de paramètre

### Définition de paramètres de propriété {#core:40d229c4-33c4-11e2-9147-a3eaf356c37c}
Des paramètres permettent de modifier le comportement des propriétés du document.

Leur syntaxe est toujours de la forme `PROP;[propid];[param]`, avec les correspondances suivantes :

[propid]
:   le nom de la propriété

[param]
:   définition du paramètre, sous la forme `[parameterName]=[parameterValue]`.

Par exemple :

    PROP;title;sort=asc

Les paramètres de propriété disponibles sont :

sort
:   Permet de spécifier si la propriété est disponible dans les recherches et les rapports, et quel est son ordre de tri par défaut.

    Les valeurs possibles sont :

    *   `no` : la propriété n'apparaîtra pas les recherches et rapports ;
    *   `asc` : la propriété est disponible dans les recherches et les rapports, et est trié par défaut par ordre ascendant ;
    *   `desc` : la propriété est disponible dans les recherches et les rapports, et est trié par défaut par ordre descendant.

    Les propriétés suivantes ont un paramètre *sort* par défaut :

    *   initid : sort=desc,
    *   revdate : sort=desc,
    *   state : sort=asc,
    *   title : sort=asc

    Les autres propriétés sont par défaut à sort=no.

### Définition de propriétés de famille {#core:6f013eb8-33c7-11e2-be43-373b9514dea3}

Lors de l'import d'une famille, on peut initialiser ses propriétés au moyen des mots-clé suivants :

CPROFID
:   Valeur par défaut de la propriété *profid*.

    Lors de l'import, les vérifications suivantes sont effectuées :

    *   Si la famille hérité de dossier, le document référencé doit être de la famille profil de dossier,
    *   Si la famille hérite de recherche, le document référencé doit être de la famille profil de recherche,
    *   Sinon le document référencé doit être de la famille profil de document.

    Si la valeur est vide le profil de document par défaut est enlevé.

CVID
:   Valeur par défaut de la propriété *cvid*.

    Si la valeur est vide le contrôle de vue par défaut est enlevé.

DFLDID
:   identifiant du dossier principal permettant de constituer une arborescence spécifique à la famille .

    Ce dossier est nécessaire pour manipuler les documents d'une famille depuis  l'application "ONEFAM".
    Il peut être égal au 'auto', ce qui a pour effet de créer un dossier principal automatiquement.
    Si cette propriété est déjà renseignée, la nouvelle valeur ne sera pas prise en compte.
    Si la valeur est vide le contrôle de vue par défaut est enlevé.

ICON
:   nom du fichier image définissant l'icône de la famille.
    Cette icône doit être une image de taille 48×48 pixels.
    Si une icône est déjà présente pour cette famille, elle ne sera pas modifiée.

METHOD
:   Indique le nom du fichier contenant les méthodes supplémentaires de la famille.
    Cette propriété peut être utilisé sur plusieurs lignes, avec la sémantique suivante :

    *   Lorsque le nom est préfixé par *+*, son contenu est concaténé directement dans la classe générée ;
    *   Lorsque le nom est préfixé par *, le fichier n'est pas intégré directement dans la famille, mais une classe intermédiaire est générée. Cela permet notamment de surcharger les méthodes ultérieurement.

    Si la valeur est vide les méthodes associées seront enlevées.

PROFID
:   identifiant du document profil de famille pour cette famille.
    Lors de l'import, les vérifications suivantes sont effectuées :

    *   Ce document doit être de la famille 'profil de famille'.

    Si la valeur est vide le profil de famille est enlevé.

SCHAR
:   Indique les modalités de révision des documents de cette famille :

    *   *R* : Révision automatique à chaque modification,
    *   *S* : document non révisable

    Si la valeur est vide la caractéristique spéciale par défaut est enlevée.

TAG
:   Initialise les valeurs de la propriété *atags*
    Chaque utilisation de la balise TAG ajoutera une valeur à la propriété *atags*
    Les tags applicatifs ne peuvent être supprimés par cette cette directive.

TYPE
:   valeur par défaut de la propriété *type*
    Si la valeur est vide, le type inféré est *C*.

USEFOR
:   Caractère désignant une utilisation spéciale. Seulement pour les documents systèmes :

    *   *W* : pour les cycles de vie
    *   *G* : pour les intercalaires de chemise
    *   *P* : pour les profils

    Si la valeur est vide l'utilisation spéciale par défaut est enlevée.

WID
:   Valeur par défaut de la propriété *wid*.
    Si la valeur est vide le cycle par défaut est enlevé.

### Définition d'attributs {#core:bc3fad86-33cc-11e2-9a69-1bbd9c32b0f2}

Un attribut est défini par la syntaxe suivante :

    ATTR;[id_attribut];[id_conteneur];[label];[in_title];[in_abstract];[type];[ordre];[visibility];[required];[link];[phpfile];[phpfunc];[elink];[constraint];[options]

avec les correspondances suivantes :

ATTR
:   **Obligatoire**
    Signale le début d'une définition d'attribut.

[id_attribut]
:   **Obligatoire**
    Identifiant système de l'attribut.
    Il sera automatiquement converti en minuscules.

    Il sert de référence lors des définitions des fonctions et des liens.
    Cet item n'est plus modifiable une fois créé car il peut être utilisé dans les parties spécifiques de la famille.

    Cet identificateur doit être unique dans la famille.
    Une redéclaration équivaut à une modification des caractéristiques de l'attribut.

    <div class="astuce"><span class="fixme MCO">nommage des attributs</span></div>

[id_conteneur]
:   **Obligatoire** (sauf pour les attributs de type *frame* ou *tab*)
    Identifiant système de l'attribut structurant ou tableau contenant cet attribut.

    Le type *tab* ne peut pas avoir d'attribut conteneur.

    Le type *frame* peut être contenu dans un *tab*, ou ne pas avoir d'attribut conteneur.

    Le type *array* doit être contenu dans un *frame*.

    Tous les autres attributs doivent être contenus dans un *array* ou un *frame*.

[label]
:   <span class="fixme MCO">obligatoire?</span>
    Libellé de l'attribut.

    Ce libellé sera automatiquement traduit s'il est présent dans le catalogue de traduction
    (la clé correspondante est de la forme `[FAMNAME]#[attrid]`,
    avec [FAMNAME] le nom logique de la famille et [attrid] le nom logique de l'attribut, en minuscule).

[in_title]
:   **Obligatoire** (sauf pour les attributs de type *array*, *frame* ou *tab*)
    Indique que l'attribut sera utilisé dans la composition du titre du document.

    Le titre du document est alors composé en concaténant tous les attributs définis comme tels,
    par ordre croissant de leur *ordre* et en les séparant par des espaces.

    Cette caractéristique est ignorée sur les attributs de type *array*, *frame* ou *tab*.

    Si aucun attribut n'est marqué comme composant le titre, ou si tous ces attributs sont vides,
    le titre sera *Document sans titre* suivi de l'id du document.

    Les valeurs possibles sont :

    *   `Y` pour *yes*
    *   `N` pour *no*

[in_abstract]
:   Indique que l'attribut sera utilisé dans le résumé du document.

    Le résumé du document est utilisé pour construire la fiche résumé dans l'application ONEFAM.

    Les valeurs possibles sont :

    *   `Y` pour *yes*
    *   `N` pour *no*

[type]
:   type de l'attribut, conformément aux types définis dans [la partie correspondante][type_attribut]

    Cette colonne permet également de définir le formatage de l'attribut :

    *   attributs de type *text*

        Le formatage est effectué avec la [syntaxe sprintf][PHP_sprintf].

        Par exemple, `text("%s environ")` ajoute *environ* après la valeur ;
        tandis que `text("<b>%s</b>")` affichera la valeur en gras.

    *   attributs de type *int* ou *double*

        Le formatage est effectué avec la [syntaxe sprintf][PHP_sprintf].

        Par exemple, `double("%.02f")` affiche le nombre avec 2 décimales ;
        tandis que `integer("%d m²")` : la valeur suivie de *m²* ;
        et que `double("%.02f %%")` : affiche *%* après le nombre.

    *   attributs de type *date*, *time* et *timestamp*

        Le formatage est effectué avec la syntaxe [strftime][PHP_strftime].

        Par exemple, `time("%H:%M:%S")`, ou `timestamp("%A %d %B %Y %X")`.

[ordre]
:   **Obligatoire** (sauf pour les attributs de type *frame* ou *tab*)
    Définit l'ordre de présentation des attributs dans le document.

    Cette caractéristique est ignorée sur les attributs de type *frame* ou *tab*.

[visibility]
:   **Obligatoire**
    Définit la visibilité par défaut de l'attribut.

    Les valeurs possibles sont :

    *   `H` (*Hidden*) : attribut caché. Généralement utilisé pour des attributs servant soit au calcul, soit à la génération des liens.
    *   `I` (*Invisible*) : attribut invisible : l’attribut n’est présent ni en consultation ni en modification dans le document.
        Un attribut de visibilité I n'est pas modifiable. Pour en modifier la valeur, il est nécessaire de modifier sa visibilité.
    *   `O` (*<span class="fixme MCO">O pour ?</span>*) : attribut modifiable en modification mais non visible en lecture.
    *   `R` (*Read-only*) : attribut visible en lecture seulement. Généralement utilisé pour les attributs calculés.
    *   `S` (*Statique*) : attribut visible en lecture et en modification, mais non modifiable en modification.
    *   `W` (*Writable*) : attribut visible en lecture et modifiable en modification.

    Le type array dispose en plus de la visibilité

    *   `U` <span class="fixme MCO">U pour ?</span>: Interdit l'ajout et la suppression de lignes dans le tableau.


[required]
:   **facultatif**
    Indique si l'attribut est obligatoire pour la sauvegarde du document.

    Les valeurs possibles sont :

    *   `Y` pour *yes*
    *   **`N` (valeur par défaut)** pour *no*

[link]
:   **facultatif** (Non applicable pour les types "frame", "tab", "array".)
    Ajoute un hyperlien sur l'attribut (en consultation uniquement).
    le texte de l'hyperlien sera la valeur de l'attribut.

    L'hyperlien peut être :

    *   une simple URL statique ("http://www.dynacase.org"),
    *   une URL paramétrée par
        *   des attributs du document,
        *   des propriétés du document,
        *   des paramètres applicatifs,
        *   des méthodes du document.

    *   Utilisation d'attribut du document

        Les références aux attributs du document sont écrites entre les caractères `%`,
        en indiquant l'identifiant de l'attribut, en majuscules ou en minuscules.

        Le caractère `%` est obtenu en le doublant : `TEST%%25` sera converti en *TEST%25*.

        Par exemple, soit l'attribut US_MAIL définissant le mail d'une personne.
        Pour déclencher l'édition d'un mail vers une personne, il suffit de mettre l'hyperlien suivant : `mailto:%US_MAIL%`

        Autre exemple, soit l'attribut SI_TOWN indiquant la ville de la famille société.
        Pour avoir la météo de la ville il suffit de mettre l'hyperlien suivant : `http://www.location.org/&strLocation=%SI_TOWN%&strCountry=EUR`

        Si la valeur est vide pour un des attributs de l'URL, l'hyperlien ne sera pas affiché (on ne pourra pas cliquer sur l'attribut).

        Il est possible de désigner des attributs optionnels en utilisant la notation suivante : `%?[ATTRID]%`.
        Le point d'interrogation placé après le pourcentage indique que la valeur de l'attribut peut être vide.

        Les valeurs insérées dans le lien sont encodés selon la [RFC 3986][RFC_3986] pour être utilisable comme valeur de paramètre web.

    *   Utilisation de propriétés du document

        Les références aux propriétés du document sont écrites entre les caractères `%`,
        en indiquant l'identifiant de l'attribut, en majuscules ou en minuscules.

        Le caractère `%` est obtenu en le doublant : `TEST%%25` sera converti en *TEST%25*.

        Les mots-clefs spéciaux suivants peuvent être utilisés pour la composition de l'URL :

        *   `%S%` : est remplacé par l'URL relative vers dynacase,
        *   `%I%` : est remplacé par l'identifiant (équivalent à %ID%),
        *   `%T%` : est remplacé par le titre (équivalent à %TITLE%).

        Les valeurs insérées dans le lien sont encodés selon la [RFC 3986][RFC_3986] pour être utilisable comme valeur de paramètre web.

    *   Utilisation de paramètres applicatifs

        Les références aux paramètres applicatifs sont écrites entre accolades,
        en indiquant l'identifiant de l'attribut, en majuscules ou en minuscules.

        Par exemple : `%S%app=TEST&action=TESTONE&arg={CORE_CLIENT}` :
        ici {CORE_CLIENT} sera remplacé par la valeur du paramètre CORE_CLIENT.

        Seuls les paramètres de *CORE* et les *paramètres globaux* sont accessibles pour la composition de l'URL.

    *   Utilisation de méthodes du document

        Les références aux méthodes du document sont écrites entre accolades `%`,
        en notant la méthode comme pour les attributs calculés.

        Les parties variables peuvent aussi faire référence à une méthode du document.
        Cette méthode doit retourner une chaîne de caractère encodée selon la [RFC 3986][RFC_3986] qui sera insérée dans la variable.

        Par exemple : `%::myTitleLink()%&x=3`

            [code php]
            public function myTitleLink(){
                return sprintf('http://www.test.net/?b=%s',
                    rawurlencode($this->getTitle())
                );
            }

[phpfile]
:   **Facultatif** (Non applicable pour les types "frame", "tab", "array".)
    Nom du fichier php pour l'[aide à la saisie](#core:d72c76aa-33fa-11e2-a2a0-e75d60b6f6bb).

[phpfunc]
:   **Facultatif** (Non applicable pour les types "frame", "tab", "array".)
    Nom et attributs de la fonction pour l'aide à la saisie,
    ou nom et attributs de la méthode de calcul s'il s'agit d'un attribut calculé,
    ou définition des clés-valeurs dans le cas d'un attribut de type énuméré.

[elink]
:   **facultatif** (Non applicable pour les types "frame", "tab", "array".)
    Extra lien supplémentaire.

    Cet extra lien sera présenté en modification uniquement, sous la forme d'un bouton supplémentaire.

    La syntaxe de l'extra lien est la même que celle de la colonne *link*.

[constraint]
:   **facultatif** (Non applicable pour les types "frame", "tab", "array".)
    Nom et attributs de la méthode de [contrainte](#core:16854574-33fc-11e2-9d30-47551fea8d89)

[options]
:   **facultatif**
    Liste des options à appliquer à l'attribut. Les options dépendent du [type d'attribut][type_attribut].

    Les options se présentent sous la forme de couples clé/valeur séparés par des `|`.

    Par exemple: `esize=3|elabel=saisissez votre prénom`

<!-- links -->
[PHP_sprintf]: http://php.net/manual/fr/function.sprintf.php "Documentation de la fonction sprintf sur php.net"
[PHP_strftime]: http://php.net/manual/fr/function.strftime.php "Documentation de la fonction strftime sur php.net"
[RFC_3986]: http://www.ietf.org/rfc/rfc3986.txt
[type_attribut]: #core:4e167170-33ed-11e2-8134-a7f43955d6f3
