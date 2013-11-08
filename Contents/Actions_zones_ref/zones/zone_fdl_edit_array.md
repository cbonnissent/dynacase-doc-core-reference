# `[ZONE FDL:EDITARRAY]` {#core-ref:b8d2bfd5-6f42-4104-965b-c714e784b10b}

## Description  {#core-ref:0fb525ef-c96f-43f1-a26e-8100e716252d}

Cette zone permet de représenter uniquement un array d'un document en 
édition.

## Paramètres {#core-ref:8bb0af67-7412-45b0-8b70-ec99a6e8b5e3}

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

row
:   Permet de n'afficher que la nième ligne du tableau. La numérotation commence
    à 0 et si le numéro de ligne n'existe pas, il n'y a que l'entête du tableau
    qui est affiché.

## Limites {#core-ref:5268606f-aeb3-48d6-a7cb-f35e5058be85}

Cette zone ne peut-être utilisée que dans le cadre d'une 
[zone documentaire][zoneDocumentaire].

<!-- link -->

[id_document]:      #core-ref:9aa8edfa-2f2a-11e2-aaec-838a12b40353 "Propriété ID"
[property]:         #core-ref:bc3fad86-33cc-11e2-9a69-1bbd9c32b0f2
[MDNtarget]:        https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a "Descriptif de la balise a"
[head]:             #core-ref:12d0c18a-bde3-4488-ab02-a4135d0f51c7
[cdv]:              #core-ref:017f061a-7c12-42f8-aa9b-276cf706e7e0
[zoneDocumentaire]:     #core-ref:49b96dc9-64e9-4f5a-a167-396282625c1e