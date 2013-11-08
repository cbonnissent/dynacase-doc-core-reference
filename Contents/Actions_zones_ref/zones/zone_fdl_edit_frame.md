# `[ZONE FDL:EDITFRAME]` {#core-ref:e0a13c2a-5f9e-4274-a3d3-b3fc530cb204}

## Description  {#core-ref:6127fbf9-146d-400f-9502-e6ae8e91cc61}

Cette zone permet de représenter uniquement une frame d'un document en 
édition.

## Paramètres {#core-ref:97dce35d-1527-4484-aa13-b741281e9ed4}

id
:    L'[id][id_document] du document source. Facultatif si `classid` est déjà
    fourni.

classid
:   Nom logique de famille. Si `id` est fourni classid n'est pas utilisé.

frameid
:   L' [attrid][property] de la frame que l'on souhaite présenter.

vid
:   Si le document est associé à un [contrôle de vue][cdv] et que vid est une 
    vue existante de ce contrôle celle-ci est alors appliquée sur le document.


## Limites {#core-ref:fc23e061-fcba-407b-b103-74242fa3a3b3}

Cette zone ne peut-être utilisée que dans le cadre d'une 
[zone documentaire][zoneDocumentaire].

## Exemple {#core-ref:b6014552-6883-44d2-b5ff-e61ccf83fbb7}

Définition de la zone : `[ZONE FDL:VIEWFRAME?id=1216&frameid=en_contenu]`

![ Frame d'un document du zoo ](images/zones_actions/zone_fdl_edit_frame_basic.png)

<!-- link -->

[id_document]:      #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Propriété ID"
[cdv]:              #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e