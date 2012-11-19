# Paramétrage de Core {#core-ref:cfc7f53b-7982-431e-a04b-7b54eddf4a75}
 
<span class="fixme template"> template for famille/parametrage_de_core.md.</span>

## introduction

Pour paramétrer une application Dynacase, on va utiliser divers formats de fichier :

*   Les familles seront définies dans des fichiers csv
*   Le code php sera à déployer dans des fichiers php, à intégrer à la plate-forme.
*   Les documents systèmes seront importés au moyen de fichiers csv ou xml.

## Définition de familles

Les familles sont définies dans un fichier csv respectant le format suivant:

*   Encodage : UTF-8,
*   Délimiteur de texte : `` (vide),
*   séparateur de colonnes : `;`.

La définition d'une famille commence toujours par une ligne de la forme :

    BEGIN;[fromid];[title];[id];[className];[logicalName]

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

---

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
