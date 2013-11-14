# `[ZONE FDL:INPUTATTRIBUTE]` {#core-ref:cb0e961d-9af6-4a31-911d-7d261a6774a4}

## Description  {#core-ref:58ca7361-82f7-4abc-b40c-928fcf7c7f21}

Cette zone permet de composer un fragment HTML qui contient la vue en édition
de la zone de saisie d'un [type d'attribut][attribut].

## Paramètres {#core-ref:8bbb7ac8-defe-4398-b027-d87a266429b2}

id
:   L'id, au sens attribut `HTML`, de l'input généré. Il doit être unique dans 
    la page générée. Il est à noter que l'attribut `name` de l'input généré est
    au format `_<id>`. La valeur que génère le fragment HTML est stockée dans
    l'input ayant cet `id`.

type
:   Le [type d'attribut][attribut] au sens attribut de document Dynacase qui est 
    généré. De plus, le type `doclink` peut-être utilisé, celui-ci crée alors
    un attribut avec une aide à la saisie permettant de choisir un document.

label
:   Le [title][MDNtitle] au sens attribut `HTML` du fragment généré.

esize
:   Le [size][MDNSize] au sens attribut `HTML` de l'input du fragment généré.

value
:   La valeur par défaut de l'attribut généré.

phpfunc
:   Identique à la caractéristique [phpfunc][phpfunc].

phpfile
:   Identique à la caractéristique [phpfile][phpfile].

eformat
:   Identique à l'option [eformat][eformat].

options
:   Les options d'affichage de l'attribut en cours. La liste des options est 
    disponible dans le [chapitre sur les attributs][attribut].

jsevent
:   Permet d'ajout un attribut au sens `HTML` au fragment généré. La chaîne 
    est directement injectée tel quel dans l'input généré. **Attention** : Il 
    faut faire un [encodeURIComponent][encodeURI], ou assimilé, sur la chaîne.
    Par exemple, pour insérer `onclick='alert("dynacase");'`, il faut écrire 
    `onclick%3D'alert(%22dynacase%22)%3B'`.

famid
:   Cette option n'est valide que si le type de l'attribut est `doclink` et elle
    indique la famille de référence de l'aide à la saisie.

## Limites {#core-ref:42b12eaf-8990-4632-b61f-3fde820ee309}

Dans le cadre de l'utilisation de cette zone en dehors d'une 
[zone documentaire][zoneDocumentaire], il faut :

* ajouter les balises `[JS:REF]` et `[CSS:CUSTOMREF]` pour pouvoir charger
les assets nécessaires au fonctionnement du fragment HTML inséré. Il est à noter
que la zone [`[ZONE FDL:HTMLHEAD]`][head] insère ces balises,
* exécuter la fonction `editmode($action);` dans le contrôleur associé à la vue,
celle-ci charge les assets (JS et CSS nécessaires au fonctionnement du input).

## Exemples {#core-ref:6317fd01-e0f1-4567-b4f3-685954633e5b}

`[ZONE FDL:INPUTATTRIBUTE?id=Dynacase&label=Dynacase&jsevent=onclick%3D'alert(%22Dynacase%22)')%3B&value=Dynacase]`

![ Zone de type texte ](images/zones_actions/zone_fdl_input_attribute_texte.png)

`[ZONE FDL:INPUTATTRIBUTE?id=Ddynacase&type=date]`

![ Zone de type date ](images/zones_actions/zone_fdl_input_attribute_date.png)

<!-- link -->

[attribut]:             #core-ref:4e167170-33ed-11e2-8134-a7f43955d6f3
[head]:                 #core-ref:12d0c18a-bde3-4488-ab02-a4135d0f51c7
[MDNtitle]:             https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement.title "Attribut title : MDN"
[MDNSize]:              https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Input "Attribut Input : MDN"
[phpfunc]:              #core-ref:1128e658-48f5-440f-9fd1-2d714e99eecd
[phpfile]:              #core-ref:7362e2ff-cfb5-45f0-a81d-e02eab6d0fb6
[eformat]:              #core-ref:4f14142f-6aac-473f-a0e3-87803febb883
[encodeURI]:            https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent "encodeURI"
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e