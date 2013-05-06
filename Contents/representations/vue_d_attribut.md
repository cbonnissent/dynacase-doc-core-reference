# Vue d'attribut {#core-ref:26dca29e-92b3-445f-a6d8-51eaa297219a}

Les *vues d'attribut* permettent de définir la représentation d'un attribut.
Elles peuvent être utilisées lorsque la représentation par défaut du document
correspond, à l'exception de quelques attributs isolés.

Une vue d'attribut est composée de :

*   un fichier de template, définissant la structure,
*   une méthode (appelée contrôleur de vue) du document à représenter,
    définissant les valeurs.  
    Cette méthode peut également être omise. dans ce cas, dynacase fera appel
    au [contrôleur de vue par défaut][default_view_controleur].

Par convention :

*   le fichier de template porte l'extension xml,
*   son nom détermine le nom de la vue,
*   la méthode associée doit porter le même nom.  
    L'objet `Layout` est accessible au moyen de la propriété `lay` de l'objet
    courant (`$this->lay`).

<span class="fixme" data-assignedto="EBR">préciser les règles de casse</span>

## Le contrôleur de vue {#core-ref:d1016f0b-2640-4756-8863-044ede03aaf0}

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

### Contrôleur par défaut {#core-ref:9c6d90f7-84e8-4d84-bd75-69899b8d5b4f}

En l'absence de méthode correspondant à la vue, le contrôleur par défaut est
appelé. cette méthode dépend du type de vue :

*   en consultation, la méthode appelée est `Doc::viewDefaultCard`.
*   en modification, la méthode appelée est `Doc::viewProp` suivi de
    `Doc::editAttr`.<span class="fixme" data-assignedto="EBR">c'est volontairement inconsistant avec les vues documentaires ?</span>

## Syntaxe d'une zone de vue d'attribut {#core-ref:a4458a39-3a5f-451d-8d6f-3a88244c5e03}

Une zone de vue d'attribut s'exprime sous la forme `APP:ZONE:OPTIONS`,
<span class="fixme" data-assignedto="EBR">on peut rajouter des paramètres ? et si oui, où ?</span>avec les correspondances suivantes :

**`APP`** (obligatoire)
:   Le nom de l'application dans laquelle se trouve le template.

**`ZONE`** (obligatoire)
:   Le nom de la zone.

`OPTIONS` (facultatif)
:   Une option de représentation. ces options dépendent du type de vue :
    
    *   [en édition][zone_options_view]
    *   [en modification][zone_options_edit]

<span class="fixme" data-assignedto="EBR">En fait, ces options n'affectent pas notre zone, mais les zones encapsulantes, non ?</span>

## Vue de consultation {#core-ref:9cb7b313-7294-424d-bd86-a63155025902}

<span class="fixme" data-assignedto="EBR">modèle de boites / zones ?</span>

Afin de spécifier la vue d'attribut à utiliser en consultation, il faut utiliser
l'option `viewtemplate`.<span class="fixme" data-assignedto="EBR">à documenter dans les options d'attribut ? -> valable sur tous les attributs sauf tab et array ?</span>sur l'attribut concerné.

### Options des vues d'attribut en consultation {#core-ref:ffc29ae1-7438-4a5b-aca2-83dc98be4d9d}

Les options disponibles en consultation sont les suivantes :

`S`
:   signifie que le libellé de l'attribut ne sera pas affiché et le template
    prendra toute la largeur du document.

### Utilisation des valeurs du document {#core-ref:1a703a73-68a4-4f97-a422-7c5aa26d9822}

le [contrôleur par défaut][default_view_controleur] fait automatiquement appel
aux méthodes `Doc::viewAttr` et `Doc::viewProp`. Elles initialisent les clés
suivantes :

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

Lors de l'utilisation d'un contrôleur personnalisé, il est possible d'appeler
ces méthodes afin de générer les clés correspondantes. Il est également possible
de définir d'autres clés en utilisant les différentes méthodes du `Layout`.

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, les clés `L_ATTRID` et `V_ATTRID` seront
des chaînes vides. `S_ATTRID`, pour sa part, n'est pas affecté par les
visibilités.

## Vue de modification {#core-ref:4faa4b17-56fc-4e42-a091-f1a97b7591b8}

<span class="fixme" data-assignedto="EBR">modèle de boites / zones ?</span>

Afin de spécifier la vue d'attribut à utiliser en consultation, il faut utiliser
l'option `edittemplate` <span class="fixme" data-assignedto="EBR">à documenter dans les options d'attribut ? -> valable sur tous les attributs sauf tab et array ?</span>sur l'attribut concerné.

### Options des vues d'attribut en modification {#core-ref:54fc1da2-da41-4302-a4fa-bfebea1d640f}

Les options disponibles en modification sont les suivantes :

`S`
:   signifie que le libellé de l'attribut ne sera pas affiché et le template
    prendra toute la largeur du document.
    
`U`
:   signifie que l'input généré par le mot-clef `[V_ATTRNAME]` prendra toute la
    largeur disponible. Cette option est à utiliser si le template ne comporte
    qu'un seul input.

### Utilisation des valeurs du document {#core-ref:92002e19-2b6c-474c-9f6b-0ff265dce351}

le [contrôleur par défaut][default_view_controleur] fait automatiquement appel
aux méthodes `Doc::editAttr` et `Doc::viewProp`. Elles initialisent les clés
suivantes :

*   `L_ATTRID` pour chaque attribut : le libellé (traduit) de l'attribut,
    entouré d'une balise `<b/>` si l'attribut est obligatoire),
*   `V_ATTRID` pour chaque attribut : un input pour l'attribut,
*   `W_ATTRID` pour chaque attribut : `true` si l'attribut est visible, `false`
    sinon.

Lors de l'utilisation d'un contrôleur personnalisé, il est possible d'appeler
ces méthodes afin de générer les clés correspondantes. Il est également possible
de définir d'autres clés en utilisant les différentes méthodes du `Layout`.

**Attention** : toutes ces clés respectent les visibilités : si l'utilisateur
n'a pas le droit de voir un attribut, la clé `V_ATTRID` génère un
`<input type="hidden"/>`.

Lors de l'utilisation d'un contrôleur personnalisé, il est possible d'appeler
ces méthodes afin de générer les clés correspondantes. Il est également possible
de définir d'autres clés en utilisant les différentes méthodes du `Layout`.

## Limitations

Les vues d'attribut ne sont pas gérées par Dynacase dans les vues de document
personnalisées.

chaque vue d'attribut travaille sur une instance différente de l'objet `Doc`
correspondant au document en cours de consultation ou de modification.

Les vues d''attribut ne s'appliquent pas aux attributs de type *tab*, ou
*array*. de plus, pour les attributs contenus dans un array, il faut utiliser
les [vues de rangée de tableau][array_row_view] <span class="fixme" data-assignedto="EBR">les vues d'attribut sont ignorées sur les attributs dans les tableaux ?</span>.

<!-- links -->
[default_view_controleur]: #core-ref:9c6d90f7-84e8-4d84-bd75-69899b8d5b4f
[zone_options_view]: #core-ref:ffc29ae1-7438-4a5b-aca2-83dc98be4d9d
[zone_options_edit]: #core-ref:54fc1da2-da41-4302-a4fa-bfebea1d640f
[array_row_view]: #core-ref:9e76ac49-3b17-435b-ba25-a7122369be85
