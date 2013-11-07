# `[ZONE FDL:VIEWARRAY]` {#core-ref:770c8d18-3e4a-4bd1-8878-be88f5ef9392}

## Description  {#core-ref:83fc63df-5e8e-4dfc-abac-22eee21b7406}

Cette zone permet de représenter uniquement un array d'un document en 
consultation.

## Paramètres {#core-ref:f221352e-1cc7-42d0-baec-c854267f4ebd}

id
:    L'[id][id_document] du document source. Facultatif si `classid` est déjà
    fourni.

classid
:   Nom logique de famille. Si `id` est fourni classid n'est pas utilisé.

arrayid
:   L' [attrid][property] de la frame que l'on souhaite présenter.

vid
:   Si le document est associé à un [contrôle de vue][cdv] et que vid est une 
    vue existante de ce contrôle celle-ci est alors appliquée sur le document.

target
:    Contenu de l'attribut [target][MDNtarget] des liens générés.

ulink
:    `N` : Si il est à N les liens ne sont pas rendu et ils sont remplacés par du
    text.


## Limites {#core-ref:28b60aa0-1c90-42fe-96c0-fc6c26fc7945}

Dans le cadre de l'utilisation de cette zone en dehors d'une 
[zone documentaire][zoneDocumentaire], il faut :

* inclure la référence `[CSS:CUSTOMREF]` ou la zone [`[ZONE FDL:HTMLHEAD]`][head].

## Exemples {#core-ref:d0c81209-600b-4c68-af9e-72f35bd45005}

Définition de la zone : `[ZONE FDL:VIEWARRAY?id=1216&arrayid=en_t_animaux]`

![ Array d'un document du zoo ](images/zones_actions/zone_fdl_view_array.png)

<!-- link -->

[id_document]:      #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Propriété ID"
[property]:         #core-ref:bc3fad86-33cc-11e2-9a69-1bbd9c32b0f2
[MDNtarget]:        https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a "Descriptif de la balise a"
[head]:             #core-ref:12d0c18a-bde3-4488-ab02-a4135d0f51c7
[cdv]:              #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e