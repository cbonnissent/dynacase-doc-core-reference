# Vue OpenDocument Text {#core-ref:d03e0905-2be1-4649-a823-9f64e94cba29}

Une vue _openDocument text_ permet de générer une *représentation bureautique*
du document. Cette représentation est au format *odt*, et peut être convertie en
*pdf*, ou autre format bureautique, au moyen du [moteur de transformation][TE].

Étant donné que cette représentation est binaire, il y a de nombreuses
différences entre les vues _openDocument text_ et les représentations html.

Il est à noter que les vues _openDocument text_ ne sont utilisables que pour la
consultation.

Une vue _openDocument text_ est composée de :

*   un fichier de template (au format *odt*), définissant la structure,
*   une méthode (appelée *contrôleur de vue*) du document à représenter,
    définissant les valeurs.  
    Cette méthode peut également être omise. Dans ce cas, dynacase fera appel
    au [contrôleur de vue par défaut][default_view_controleur].

La syntaxe de la [zone documentaire][zonedocumentaire] d'une vue _openDocument
text_ doit obligatoirement comporter l'option _binaire_ (option `B`).

Exemple :

    MY_APP:my_Document.odt:B

Dans cet exemple le fichier `MY_APP/Layout/my_Document.odt` sera utilisé comme
template.

## Référence d'un template à partir d'un paramètre de famille {#core-ref:1ac6f94e-77cc-4f8d-a7b1-cad03e16c233}

Si la famille possède un paramètre de type `file`. Celui-ci peut être utilisé
comme template. Dans ce cas, la syntaxe de la zone est de la forme :

    THIS:MY_ARGFILE:B

Dans cet exemple `MY_ARGFILE` peut être soit un paramètre de la famille, soit un
attribut du document.

Si le paramètre ou l'attribut est un attribut fichier inclus dans un tableau, il
est nécessaire d'ajouter l'index pour préciser le template :

    THIS:MY_ARGFILES[2]:B

Dans cet exemple, le template est la troisième valeur de l'attribut multiple
`MY_ARGFILES`.

## Le contrôleur de vue {#core-ref:a7e88a30-c481-4e94-975f-c91c2eb4257d}

Pour qu'une méthode du document soit utilisable en tant que contrôleur d'une
vue, il est nécessaire de lui ajouter la phpDoc `@templateController` afin
de se prémunir d'une éventuelle exécution arbitraire de code.

Les paramètres reçus par la méthode sont au nombre de 3 :

*   `$target` (string) : toujours `"ooo"` (ne sert que pour les vues non odt),
*   `$ulink` (booléen) : toujours `false` (ne sert que pour les vues non odt),
*   `$abstract` (booléen) : indique s'il faut générer uniquement les
    attributs de la fiche résumé (`false` par défaut).

Par convention :

*   le fichier de template porte l'extension `odt`,
*   son nom (en minuscule) détermine le nom de la vue,
*   la méthode associée doit porter le même nom (la casse du nom de la méthode
    n'est pas prise en compte).  
    L'objet `OooLayout` est accessible au moyen de la propriété `lay` de l'objet
    courant (`$this->lay`).

### Contrôleur par défaut {#core-ref:303fbb4d-a688-4fd7-8329-bbc799251889}

En l'absence de méthode correspondant à la vue, le contrôleur par défaut est
appelé. Ce contrôleur est `Doc::viewDefaultCard`.

### Utilisation des valeurs du document en consultation {#core-ref:f239d142-608b-49a2-b273-0760e78208cf}

Le [contrôleur par défaut][default_view_controleur] fait automatiquement appel
aux méthodes `Doc::viewAttr` et `Doc::viewProp`. Elles initialisent les clés
suivantes :

*   viewAttr va créer :
    *   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
    *   `V_ATTRID` pour chaque attribut : la valeur (au format html) de
        l'attribut,
    *   `S_ATTRID` pour chaque attribut : `true` si l'attribut est vide, `false`
        sinon
*   viewProp va créer :
    *   `ATTRID` pour chaque attribut : la valeur brute de l'attribut,
    *   `PROPID` pour chaque propriété : la valeur brute de la propriété,
    *   `V_TITLE` une ancre vers le document lui-même avec son titre.

**Note** : Toutes ces clefs sont en majuscules.

Lors de l'utilisation d'un contrôleur personnalisé, il est possible d'appeler
ces méthodes afin de générer les clés correspondantes. Il est également possible
de définir d'autres clés en utilisant les différentes méthodes de la classe
`OooLayout`.

**Attention** : Toutes ces clés respectent les visibilités : si la visibilité 
d'un attribut est `H` pour un utilisateur, les clés `L_ATTRID` et `V_ATTRID` 
sont des chaînes vides. `S_ATTRID`, pour sa part, n'est pas affecté par les
visibilités.

## Spécificités du système de template pour les vues openDocument text {#core-ref:3742b35d-ddc0-440e-a0aa-08ea2faf0e46}

Bien que la syntaxe soit très proche de celle des
[vues textuelles][textual_views_syntax], il y a quelques différences à prendre
en compte.

Ces différences sont liées à la structuration des documents _odt_, qui sont en
fait des documents _xml_, et dont la structure doit rester valide.

Parmi ces différences, il y a notamment :

*   les balises `ZONE` ne sont pas prises en compte,
*   les balises `BLOCK` et `ENDBLOCK` ne sont pas prises en compte et la gestion
    des éléments répétables se fait de [manière spécifique][repetables]
    
    En effet, la notion de *répétable* existe au sein des documents *odt* sous
    la forme des
    *   listes à puce,
    *   tableaux.
*   La gestion des images se fait de [manière spécifique][images].

### Placer une clé dans le template _odt_ {#core-ref:3caf8ced-fa1c-4969-bd72-7767755e109d}

Les clés utilisent la même notation que dans les templates non odt : `[KEY]`.

Bien que cela ne soit pas obligatoire, il est recommandé d'utiliser des [champs
utilisateur][fields] dont :

*   le *nom* est libre et n'est pas utilisé par le système de templates,
*   la *valeur* est la clé souhaitée,
*   le *format* est *text* (vous pouvez utilisez d'autres formats, mais dans ce
    cas, à vous de savoir comment sera rendue la valeur générée).

L'utilisation de champs plutôt que du texte libre présente plusieurs avantages :

*   cela simplifie la modification ultérieure par des utilisateurs,
*   cela permet de recenser l'ensemble des attributs, y compris ceux qui ne sont
    pas utilisés,
*   le remplacement étant fait au niveau du xml sous-jacent, si l'on n'utilise
    pas les champs, il est possible que des balises viennent couper la clé. Par
    exemple, `[MA_KEY]` peut en fait avoir été stocké sous la forme
    `[<span>MA</span>_KEY]` qui n'est alors pas reconnue par le moteur de
    template.

![ champ utilisateur ](representations/odt_field.png)

### Placer une clé dans les propriétés du template _odt_ {#core-ref:efc93ece-8dc6-4291-b152-c6c5cc3bc4ef}

Il est également possible d'utiliser les clés dans les propriétés du fichier, où
elles sont aussi remplacées.

### Images {#core-ref:d1625c57-57f6-48eb-ab3e-e3690dddec6c}

Pour incorporer des images issues d'un attribut de type `image`, il faut insérer
dans le template une image quelconque qui sert de placeholder et qui est
ensuite remplacée par l'image issue de l'attribut du document lors de la
composition du template.

Pour cela, il faut :

1.  Insérer une image quelconque dans le fichier, au moyen du menu
    <span class="menu"><span class="menu-item">Insertion</span>
    <span class="menu-item">Image</span>
    <span class="menu-item">À partir d'un fichier</span></span>,
    
2.  Cliquer sur le menu contextuel de l'image et choisir
    <span class="menu"><span class="menu-item">image</span></span>,
    
3.  Renseigner les clés (qui référencent la valeur et le label de l'attribut de
type `image`) dans l'onglet *[Options]*, champ *nom*.
    
    ![ nom de l'image ](representations/odt_insert_image.png)

En ce qui concerne la taille de l'image, la largeur est conservée.
La hauteur est calculée en fonction du ratio de l'image.

**Attention** : chaque image « placeholder » doit être insérée de cette façon,
et il ne faut surtout pas faire de copier-coller d'une image. En effet, en cas
de copier-coller, les 2 images font référence en interne à la même image, même
en définissant des *noms* différents.

### Répétables {#core-ref:9287cbe8-a6ca-41f9-9547-b7a970ae6584}

La gestion des éléments multiples est intrinsèque à la structure d'un fichier
odt : les listes et tableaux sont multiples par nature. Aussi, utiliser la clé
d'un attribut multiple dans une liste ou un tableau va automatiquement insérer
le nombre d'éléments nécessaires.

#### Déclarer des éléments répétables dans des listes {#core-ref:c8c4c1cd-22cf-4055-939f-2879fbc69484}

Le template :
![ template ](representations/odt_repetable_source_bullet.png)

peut donner le fichier :
![ résultat ](representations/odt_repetable_resultat_bullet.png)

#### Déclarer des éléments répétables dans des tableaux {#core-ref:1f04c69d-1577-41aa-a05d-34191888f322}

Le template :
![ template ](representations/odt_repetable_source_array.png)

peut donner le fichier :
![ résultat ](representations/odt_repetable_resultat_array.png)

### Conditions {#core-ref:5b53867d-7fb2-4aff-b4dc-941b7d0254b4}

Les conditions (`[IF]` / `[ENDIF]`) sont utilisables, à condition de respecter
la structure du document (Un fichier ODT étant, en interne, un XML, ce fichier
doit conserver son intégrité).

Aussi, les balises ouvrante et fermante doivent être au même niveau. Par
exemple, on ne peut pas mettre un IF au milieu d'un tableau et le ENDIF à
l'extérieur du tableau : le IF et le ENDIF doivent être dans la même cellule du
tableau. Il est possible de les utiliser dans le même paragraphe ou entre
plusieurs paragraphes de même niveau.

En cas d'erreur de structure, un message d'erreur apparaît lors de la
consultation du document généré :
![ Erreur de structure ](representations/odt_structure_error.png)

### attributs *htmltext* {#core-ref:9d0e5de3-6176-4b75-aeaa-4b78f0d0a62d}

Le type *htmltext* implique des restrictions d'usage : La valeur de l'attribut
est filtrée lors de l'incorporation dans un fichier openDocument. Seules
certaines balises HTML sont supportées. Les balises non supportées sont ignorées
et leur contenu n'est pas affiché.

Une clef correspondant à un attribut *htmltext* doit être placée seule dans le
paragraphe, et ne doit pas contenir de texte autour.

### Limitations {#core-ref:b2f63c3f-9f26-47f6-8172-00c23b6a9948}

#### Limitation pour les attributs de type Htmltext {#core-ref:989af790-e851-42f2-b18d-cf5384ba1253}

*   Les couleurs, police, taille de police ne sont pas prises en compte,
*   pour la mise en forme, seuls les mises en gras, souligné et en italique sont
    supportées,
*   seuls les titres de niveau 1 à 4 sont pris en compte,
*   lors de l'utilisation dans une liste, les tableaux ne sont pas interprétés
    et sont traités comme du texte brut,
*   un attribut htmltext ne peut pas être utilisé dans les entêtes et pied de
    pages,
*   un attribut htmltext ne peut pas être utilisé dans les propriétés du
    document,
*   les styles (css) ne sont pas pris en compte,
*   les imbrications de paragraphes, exemple :
    
        [html]
        <div>Texte ext 1<div>Texte int</div>texte ext 2</div>
     
    [ne sont pas supportées][htmlodterr]. L'exemple précédent provoquera une erreur 
    d'affichage de fichier openDocument.

#### Limitations pour les répétables {#core-ref:49c08a3f-c112-497b-9272-d5753f292113}

*   les répétables ne sont pas gérés dans les entêtes et pied de pages,
*   les répétables ne sont pas gérés dans les propriétés du document,
*   les mots-clefs BLOCK/ENDBLOCK ne sont pas gérés,
*   les listes ne peuvent pas avoir plusieurs niveaux d'imbrication.

#### Limitations pour les relations {#core-ref:d3ca2d74-64dd-4e15-9c84-686515ffc8cb}

*   Les relations de document sont partiellement gérées :
    seul le titre du document est affiché (sans lien).

#### Autres limitations {#core-ref:02b246f0-1c2b-4ef9-8aeb-735ad26ecf3f}

*   les zones (ZONE) ne sont pas gérés,
*   les attributs de type fichier, couleur ne sont pas gérés.

## Utilisation avancée {#core-ref:37462ff7-e03a-4fde-99a8-cafb6cedf721}

L'utilisation d'un contrôleur spécifique ainsi que les manipulations avancées
sont détaillées dans la [partie avancée sur les vues OpenDocument
Text][advanced_odt].

<!-- links -->
[TE]: https://docs.anakeen.com/dynacase/3.2/dynacase-doc-tengine-installation-operating/website/book/index.html "Installation et exploitation Tranformation Engine"
[default_view_controleur]: #core-ref:303fbb4d-a688-4fd7-8329-bbc799251889
[textual_views_syntax]: #core-ref:5f4a2f4b-9ceb-42db-8ac1-2a7baa621ce2
[images]: #core-ref:d1625c57-57f6-48eb-ab3e-e3690dddec6c
[repetables]: #core-ref:9287cbe8-a6ca-41f9-9547-b7a970ae6584
[advanced_odt]: #core-ref:a8c2d27a-6490-4449-9997-2984613ed219
[zonedocumentaire]: #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e
[fields]: https://help.libreoffice.org/Writer/Variables/fr "Champs de type variable sur libreoffice.org"
[htmlodterr]:  #core-ref:5cc6bc2a-73b7-4923-87ee-5046384c97d9