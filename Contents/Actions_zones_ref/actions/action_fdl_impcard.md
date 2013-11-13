# `[ACTION FDL:IMPCARD]` {#core-ref:d7411de4-5a2e-4d64-a56f-85cd64946ff7}

## Description  {#core-ref:e4849564-e3fd-45c5-bf18-894ef9ed1613}

Cette action représente un document en consultation HTML sans menu.

## Paramètres {#core-ref:b40054a2-1541-47e6-8e56-2459b8552cfa}

id
:    L'[identificateur][id_document] du document source. **Obligatoire**.

zone
:   Nom d'une [zone documentaire][zoneDocumentaire] qui est appliquée au 
    document. Ce paramètre n'est pas pris en compte si le paramètre `vid` est valué.

vid
:   Nom d'une vue. Si jamais un [contrôle de vue][cvdoc] est associé à ce document
    et que ce contrôle de vue contient une vue ayant ce nom celle-ci est appliquée.

latest
:   (Y|L|P) : Indique quelle [révision][revise] du document est affichée :
    
    * Y : présente la dernière révision du document,
    * L : présente l'avant dernière révision du document,
    * P : présente la révision précédent celle de l'id,
    * tout autre valeur : présente la révision correspondante à l'id passé en paramètre.

state
:   Nom logique d'un état. Présente le dernier document de la lignée documentaire
    ayant cet état. Si `latest` et `state` sont présents alors seul `state` est
    pris en compte.

mime
:   [Mime type][mime] de la page de retour. Principalement utile dans le cas d'un
    template binaire [`:B`][templateB].

inline
:   Si la première lettre est à `y` ou `Y` (valide pour `yes`, `Yes`, `Y`) et le
    type `mime` a une valeur alors la représentation retournée est inline. 

ext
:   Extension du fichier retourné si le type `mime` a une valeur et que `inline`
    n'est pas à `y`.

view
:   `print` : si la view est print alors la CSS d'impression est ajoutée à la
    page.

## Limites {#core-ref:ad5324d3-d4bb-4c92-a379-a2ff9575ba69}

N/A

<!-- link -->

[id_document]:          #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Propriété ID"
[revise]:               #core-ref:882e3730-0483-4dbc-9b9d-0d0b5cc31d38
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e
[cvdoc]:                #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[MDNtarget]:            https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a "Descriptif de la balise a"
[templateB]:            #core-ref:96d615e5-b6a6-46d3-b42d-4396dbc42b8b
[dir]:                  #core-ref:977910df-1dc1-4def-9e0b-fb938f5d849f
[mime]:                 https://fr.wikipedia.org/wiki/Type_MIME "Wikipedia : Type Mime"