# Vue de document {#core-ref:cb3e2b97-ee6d-4cdf-aa25-b2e41d0d3156}
 
Les vues de documents permettent de définir la représentation d'un document.

Une vue de document est composée de :

*   un fichier de template, définissant la structure,
*   une méthode (appelée contrôleur de vue) du document à représenter,
    définissant les valeurs.  
    Cette méthode peut également être omise. dans ce cas, dynacase fera appel
    au [contrôleur de vue par défaut][default_view_controleur].

Par convention :

*   le fichier de template porte l'extension xml,
*   son nom détermine le nom de la vue,
*   la méthode associée doit porter le même nom. L'objet `Layout` sera
    accessible au moyen de la propriété `lay` de l'objet courant.

<span class="fixme" data-assignedto="EBR">préciser les règles de casse</span>

## Le contrôleur de vue {#core-ref:5da69221-eb2e-41a7-9f7a-d2c2e27c4184}

Pour qu'une méthode du document soit utilisable en tant que contrôleur d'une
vue, il est nécessaire de lui ajouter la phpDoc `@templateController` afin
de se prémunir d'une éventuelle exécution arbitraire de code.

les paramètres reçus par la méthode sont au nombre de 3 :

*   `$target` (string): nom de la fenêtre graphique qui sera utilisé pour les
    hyperliens (`"_self"` par défaut) ;
*   `$ulink` (booléen) : indique s'il faut générer les hyperliens (`true` par
    défaut) ;
*   `$abstract` (booléen) : indique s'il ne faut pas générer uniquement les
    attributs de la fiche résumé (`false` par défaut).

### Contrôleur par défaut {#core-ref:1b7cb4c6-df1e-4124-8f5d-deaeac92561b}

En l'absence de méthode correspondant à la vue, le contrôleur par défaut est
appelé. cette méthode dépend du type de vue :

*   en consultation, la méthode appelée est `Doc::viewDefaultCard`.
*   en modification, la méthode appelée est `Doc::viewDefaultCard`.<span class="fixme" data-assignedto="EBR">Cela signifie qu'en l'absence de contrôleur de vue, une vue de modification apparaîtra comme une vue de consultation !</span>.

## Syntaxe d'une zone documentaire {#core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e}

Une zone documentaire s'exprime sous la forme
`APP:ZONE:OPTIONS:TRANSFORMATION`, <span class="fixme" data-assignedto="EBR">on peut rajouter des paramètres ? et si oui, où ?</span>avec les correspondances suivantes :

**`APP`** (obligatoire)
:   Le nom de l'application dans laquelle se trouve le template.

**`ZONE`** (obligatoire)
:   Le nom de la zone.

`OPTIONS` (facultatif)
:   Une option de représentation. ces options dépendent du type de vue :
    
    *   [en édition][zone_options_view]
    *   [en modification][zone_options_edit]

<span class="fixme" data-assignedto="EBR">En fait, ces options n'affectent pas notre zone, mais les zones encapsulantes, non ?</span>

`TRANSFORMATION` (facultatif)
:   Une transformation peut être appliquée après la composition de la vue. Cette
    transformation est effectuée par le [module de transformation][TE].
    
    Il suffit de spécifier le <span class="fixme" data-assignedto="EBR">moteur</span>.

Exemples :

<span class="fixme" data-assignedto="MCO">ajouter des exemples pertinents de zones</span>

## Vue de consultation {#core-ref:d59a0b84-49c8-470b-8f38-fb138eb62be5}

Lors de la consultation d'un document, Dynacase génère une page html complète.
Cette page est structurée comme suit :

    +-------------------------------------------------+
    | FDL:FDL_CARD                                    |
    |-------------------------------------------------|
    |                                                 |
    |  +-------------------------------------------+  |
    |  | FDL:VIEWCARD                              |  |
    |  |-------------------------------------------|  |
    |  |                                           |  |
    |  |  +-------------------------------------+  |  |
    |  |  | Vue de document (FDL:VIEWBODYCARD)  |  |  |
    |  |  |-------------------------------------|  |  |
    |  |  |                                     |  |  |
    |  |  |                                     |  |  |
    |  |  |                                     |  |  |
    |  |  +-------------------------------------+  |  |
    |  |                                           |  |
    |  +-------------------------------------------+  |
    |                                                 |
    +-------------------------------------------------+

Pour plus de précisions, se reporter à la liste des <span class="fixme" data-assignedto="MCO">Zones de référence</span>.

La vue de consultation par défaut est la zone `FDL:VIEWBODYCARD`.
Afin de remplacer cette vue par une vue personnalisée, il est possible :

*   d'utiliser un [contrôle de vue][CVDOC],
*   de spécifier une zone en paramètre http : pour ce faire, il suffit de passer
    le paramètre `zone`<span class="fixme" data-assignedto="EBR">ce qui, en fait, n'a rien à voir avec une zone???</span>.

La vue personnalisée est toujours rendue encapsulée dans `FDL:VIEWCARD`,
elle-même rendue au sein de `FDL:FDL_CARD`. Aussi cette vue personnalisée
doit-elle générer un fragment qui sera inséré dans le `body` de la page.

### Options des vues documentaires en consultation

Les options disponibles en consultation sont les suivantes :

`V`
:   Pour les squelettes HTML, il signifie que le document sera affiché comme
    suit :
    
    *   inclusion des CSS systèmes dynacase
    *   pas de titre, pas d'icônes,
    *   affichage de la barre de menus
    
`T`
:   Pour les squelettes HTML, il signifie que le document sera affiché comme
    suit :
    
    *   inclusion des CSS systèmes dynacase
    *   pas de titre, pas d'icônes,
    *   pas de barre de menus

`U`
:   Pour les squelettes HTML, il signifie que le document sera affiché comme
    suit :
    
    *   pas d'inclusion des CSS systèmes dynacase
    *   pas de titre, pas d'icônes,
    *   pas de barre de menus

`S`
:   Signifie que la zone documentaire est autonome, qu'elle ne nécessite pas
    d'encapsulation HTML. Cette option est obligatoire pour tous les
    templates non HTML.  
    Lorsque cette option est utilisée avec un template html, la zone doit
    générer une page complète.

`B`
:   Pour les squelette non HTML binaires. cas notamment des fichiers
    openDocumentText (`*.odt`)

<span class="fixme" data-assignedto="EBR">Différence entre S et B ?</span>

### Utilisation des valeurs du document {#core-ref:a5c38657-4537-404f-b908-c2684d343880}

Afin d'utiliser les valeurs du document dans le template, il est possible
d'appeler les méthodes `Doc::viewAttr` et `Doc::viewProp`. Elles vont créer les
clés suivantes :

*   viewAttr va créer :
    *   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
    *   `V_ATTRID` pour chaque attribut : la valeur (au format html) de
        l'attribut,
    *   `S_ATTRID` pour chaque attribut : `true` si l'attribut est vide, `false`
        sinon
    *   <span class="fixme" data-assignedto="EBR">on n'a pas les rawValues ?</span>
    *   <span class="fixme" data-assignedto="EBR">on n'a pas les textualValues ?</span>
*   viewProp va créer :
    *   `V_PROPID` pour chaque propriété : la valeur de la propriété

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, les clés `L_ATTRID` et `V_ATTRID` seront
des chaînes vides. `S_ATTRID`, pour sa part, n'est pas affecté par les
visibilités.

## Vue de modification {#core-ref:bfbab9da-385a-45a3-af74-b17b4cca2e24}

Lors de la modification d'un document, Dynacase génère une page html complète.
Cette page est structurée comme suit :

    +-------------------------------------------------+
    | GENERIC:GENERIC_EDIT                            |
    |-------------------------------------------------|
    |                                                 |
    |  +-------------------------------------------+  |
    |  | FDL:EDITCARD                              |  |
    |  |-------------------------------------------|  |
    |  |                                           |  |
    |  |  +-------------------------------------+  |  |
    |  |  | Vue de document (FDL:EDITBODYCARD)  |  |  |
    |  |  |-------------------------------------|  |  |
    |  |  |                                     |  |  |
    |  |  |                                     |  |  |
    |  |  |                                     |  |  |
    |  |  +-------------------------------------+  |  |
    |  |                                           |  |
    |  +-------------------------------------------+  |
    |                                                 |
    +-------------------------------------------------+

Pour plus de précisions, se reporter à la liste des <span class="fixme" data-assignedto="MCO">Zones de référence</span>.

La vue de modification par défaut est la zone documentaire `FDL:EDITBODYCARD`.
Afin de remplacer cette vue par une vue personnalisée, il est possible :

*   d'utiliser un [contrôle de vue][CVDOC],
*   de spécifier une zone en paramètre http : pour ce faire, il suffit de passer
    le paramètre `zone`<span class="fixme" data-assignedto="EBR">ce qui, en fait, n'a rien à voir avec une zone???</span>.

La vue personnalisée est toujours rendue encapsulée dans `FDL:EDITCARD`,
elle-même rendue au sein de `GENERIC:GENERIC_EDIT`. Aussi cette vue
personnalisée doit-elle générer un fragment de formulaire, qui sera inséré dans
le `form` de la page.

### Options des vues documentaires en modification

Les options disponibles en modification sont les suivantes :

`S`
:   Le document est affiché comme suit :
    
    *   l'entête n'est pas affiché,
    *   les boutons *sauver* et *annuler* ne sont pas affichés,
    *   les boutons pour les changements d'état sont présents lorsqu'il y a un
        cycle de vie.

`V`
:   Le document est affiché comme suit :
    
    *   l'entête n'est pas affiché,
    *   les boutons *sauver* et *annuler* ne sont pas affichés,
    *   les boutons pour les changements d'état ne sont pas affichés.

`U`
:   Le squelette est affiché de manière brute : pas de
 formulaire prédéfini. zone=FDL:EDITBODYCARD:U

`T`
:   Le document est affiché comme suit :
    
    *   l'entête n'est pas affiché,
    *   les boutons *sauver* et *annuler* sont affichés,
    *   <span class="fixme" data-assignedto="EBR">les boutons pour les changements d'état sont affichés?</span>


### Utilisation des valeurs du document {#core-ref:37dd7910-1c29-461f-9628-5f50c543ed2d}

Afin d'utiliser les valeurs du document dans le template, il est possible
d'appeler la méthode `Doc::editAttr`. Elles va créer les clés suivantes :

*   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
    entouré d'une balise `<b/>` si l'attribut est obligatoire),
*   `V_ATTRID` pour chaque attribut : un input pour l'attribut,
*   `W_ATTRID` pour chaque attribut : `true` si l'attribut est visible, `false`
    sinon.

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, la clé `V_ATTRID` génère un
`<input type="hidden"/>`.

<!-- links -->
[default_view_controleur]: #core-ref:1b7cb4c6-df1e-4124-8f5d-deaeac92561b
[CVDOC]: #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[TE]: #FIXME
[zone_options_view]:
[zone_options_edit]: