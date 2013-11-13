# `[ZONE FDL:VIEWFRAME]` {#core-ref:48746351-91bb-4d34-b892-972f9253b9f5}

## Description  {#core-ref:a8a5d1ac-d899-4345-9ff8-ad41677431d5}

Cette zone permet de représenter uniquement une frame d'un document en 
consultation.

## Paramètres {#core-ref:4909eee2-29d3-465b-a158-7bcf239b79e3}

id
:    L'[id][id_document] du document source.

frameid
:    L'[attrid][property] de la frame que l'on souhaite présenter.

abstract
:    `Y` ou `N` : Voir seulement les [attributs résumés][property].

target
:    Contenu de l'attribut [target][MDNtarget] des liens générés.

ulink
:    `N` : Si il est à N les liens ne sont pas rendus et ils sont remplacés par du
    texte sans hyperlien.

vid
:   Si le document est associé à un [contrôle de vue][cdv] et que vid est une 
    vue existante de ce contrôle, alors celle-ci est appliquée sur le document.


## Limites {#core-ref:847f4b57-76d8-42f2-bc7c-c45101036017}

Dans le cadre de l'utilisation de cette zone en dehors d'une 
[zone documentaire][zoneDocumentaire], il faut :

* inclure le fichier `JS` généré par l'action `?app=FDL&amp;action=ALLVIEWJS`,
* inclure la référence `[CSS:CUSTOMREF]` ou la zone [`[ZONE FDL:HTMLHEAD]`][head].

## Exemples {#core-ref:d0c81209-600b-4c68-af9e-72f35bd45005}

Définition de la zone : `[ZONE FDL:VIEWFRAME?id=1216&frameid=en_contenu]`

![ Frame d'un document du zoo ](images/zones_actions/zone_fdl_view_frame_basic.png)

Définition de la zone : `[ZONE FDL:VIEWFRAME?id=1216&frameid=en_contenu&ulink=N]`

![ Frame d'un document du zoo ](images/zones_actions/zone_fdl_view_frame_ulink.png)


<!-- link -->

[id_document]:      #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Propriété ID"
[property]:         #core-ref:bc3fad86-33cc-11e2-9a69-1bbd9c32b0f2
[MDNtarget]:        https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a "Descriptif de la balise a"
[head]:             #core-ref:12d0c18a-bde3-4488-ab02-a4135d0f51c7
[cdv]:              #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e